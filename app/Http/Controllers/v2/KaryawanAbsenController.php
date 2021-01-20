<?php

namespace App\Http\Controllers\v2;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use DB;

use App\Models\Karyawan;
use App\Models\Absen;
use App\Models\Raker;
use App\Models\Jobdesk;

class KaryawanAbsenController extends Controller
{

    public function absenMasuk(Request $request)
    {
        $api_token          = $request->api_token;
        $karyawan           = Karyawan::where('api_token', $api_token)->get()[0];
        $current_date       = date('Y-m-d');
        $attendance_exists  = Absen::where('karyawan_id', $karyawan->karyawan_id)->where('tanggal', $current_date)->count();

        if($attendance_exists > 0) {
            return response()->json([
                'code'    => 401,
                'success' => (boolean) false,
                'message' => 'error, karyawan has made an absence',
            ], 200);
        }

        $current_time   = date('H:i:s');

        if($request->rencana_kerja == '' || $request->rencana_kerja == null || $request->rencana_kerja == []) {
            $rencana_kerja_obj = (boolean) true;
        } else {
            $rencana_kerja_obj = $this->storeRencanaKerja($request->rencana_kerja, $karyawan);
        }

        if(!$rencana_kerja_obj) {
            return response()->json([
                'code'    => 401,
                'success' => (boolean) false,
                'message' => 'rencana kerja must be array of object and have key : text & status & tidak boleh kosong',
                'data'    => [
                    'old_value'          => [
                        'rencana_kerja'     => $request->rencana_kerja,
                        'lt'                => $request->lt,
                        'lo'                => $request->lo,
                        'address'           => $request->address,
                        'hasil_kerja'       => $request->hasil_kerja,     
                    ],
                ]
            ], 200);
        }

        $all_jobdesk_id = [];
        foreach ( $rencana_kerja_obj as $rencana_kerja ) {
            if( !in_array($rencana_kerja->jobdesk_id, $all_jobdesk_id) ) {
                $all_jobdesk_id[] = $rencana_kerja->jobdesk_id;
            }
        }

        $valid_respon_to_client = [];
        foreach ( $all_jobdesk_id as $jobdesk_id ) {
            $valid_respon_to_client[] = [
                'jobdesk_id'    => $jobdesk_id,
                'jobdesk'       => Jobdesk::where('jobdesk_id', $jobdesk_id)->firstOrFail()->name,
                'rencana_kerja' => $this->getRakerTodayByJobdesk($request->rencana_kerja, $jobdesk_id, $karyawan),
            ];
        }

        $absen = Absen::create([
            'karyawan_id'   => $karyawan->karyawan_id,
            'status'        => $request->status_absen,
            'alasan'        => '',
            'photo'         => 'ini photo',
            'tanggal'       => $current_date,
            'jam_masuk'     => $current_time,
            'alamat'        => $request->address,
        ]);

        return response()->json([
            'code'              => 200,
            'success'           => (boolean) true,
            'message'           => 'successfully, the employee absence has been created',
            'data'              => [
                'absen_harian'      => Absen::where('karyawan_id', $karyawan->karyawan_id)->orderBy('absen_id', 'DESC')->firstOrFail(), 
                'jobdesk'           => $valid_respon_to_client,
            ]
        ], 200);
    }

    /**
     * Store rencana kerja
     *
     * @param array rencana_kerja
     */
    public function storeRencanaKerja($rencana_kerja_arr, $karyawan)
    {
        $current_date            = date('Y-m-d');
        $current_date_raker      = date('Y-m-d H:i:s');

        if(gettype($rencana_kerja_arr[0]) != 'array') {
            return false;
        }

        $raker_index_name = ['desk', 'status'];
        foreach($rencana_kerja_arr as $rencana_kerja) {
            foreach($raker_index_name as $raker_name) {
                if($rencana_kerja[$raker_name] == '' || $rencana_kerja[$raker_name] == null) {
                    return false;
                }
            }
        }

        $arr_rencana_kerja_obj = [];

        foreach($rencana_kerja_arr as $rencana_kerja) {
            if($rencana_kerja['raker_id'] === 0) {
                $arr_rencana_kerja_obj[] = Raker::create([
                    'karyawan_id'       => $karyawan->karyawan_id,
                    'jobdesk_id'        => $rencana_kerja['jobdesk_id'],
                    'desk'              => $rencana_kerja['desk'],
                    'tgl_mulai'         => $current_date_raker,
                    'tgl_selesai'       => null,
                    'status'            => $rencana_kerja['status'],
                    'note'              => '',
                    'solusi'            => '',
                    'photo'             => '',
                    'nilai'             => 0,
                    'tgl_hari_ini'      => $current_date
                ]);
            } else if($rencana_kerja['status'] == 'selesai') {
                Raker::where('raker_id', $rencana_kerja['raker_id'])->firstOrFail()->update([
                    'jobdesk_id'        => $rencana_kerja['jobdesk_id'],
                    'desk'              => $rencana_kerja['desk'],
                    'tgl_selesai'       => $current_date_raker,
                    'status'            => $rencana_kerja['status'],
                ]);

                $arr_rencana_kerja_obj[] = Raker::where('raker_id', $rencana_kerja['raker_id'])->firstOrFail();
            } else {
                $arr_rencana_kerja_obj[] = Raker::where('raker_id', $rencana_kerja['raker_id'])->firstOrFail();
            }
        }

        return $arr_rencana_kerja_obj;
    }

    public function absenPulang(Request $request) 
    {
        $api_token          = $request->api_token;
        $karyawan           = Karyawan::where('api_token', $api_token)->firstOrFail();
        $current_date       = date('Y-m-d');
        $current_date_raker = date('Y-m-d H:i:s');
        $absen              = Absen::where('karyawan_id', $karyawan->karyawan_id)->where('tanggal', $current_date)->firstOrFail();

        if( is_null($absen) ) {
            return response()->json([
                'code'      => 404,
                'success'   => (boolean) false,
                'message'   => 'error, karyawan has not been absent',
            ], 200);
        }


        $current_time   = date('H:i:s');
        $lama_kerja = floor(( strtotime($current_time) - strtotime($absen->jam_masuk) ) / 3600);
        
        $absen->update([
            'jam_pulang'      => $current_time,
            'lama_kerja'      => $lama_kerja,
            'hasil_kerja'     => $request->hasil_kerja,
        ]);
        
        foreach($request->rencana_kerja as $rencana_kerja) {
            if( $rencana_kerja['status'] == 'selesai' ) {
                $raker_done = Raker::where('raker_id', $rencana_kerja['raker_id'])->firstOrFail();
                $raker_done->update([
                    'tgl_selesai'       => $current_date_raker,
                    'status'            => $rencana_kerja['status'],
                    'desk'              => $rencana_kerja['desk'],
                ]);

                $rencana_kerja_obj[] = $raker_done;
            }
        }

        $rencana_kerja_obj = [];
        foreach($request->rencana_kerja as $rencana_kerja) {
            $raker_done = Raker::where('raker_id', $rencana_kerja['raker_id'])->firstOrFail();

            $rencana_kerja_obj[] = $raker_done;
        }
        
        return response()->json([
            'code'      => 200,
            'success'   => (boolean) true,
            'message'   => 'successfully, the employee has made an absence return back to home',
            'data'      => [
                'karyawan'          => $karyawan,
                'absen'             => $absen,
                'rencana_kerja'     => $rencana_kerja_obj,
            ],
        ], 200);
    }

    public function deleteAbsen(Request $request)
    {
        $api_token          = $request->api_token;
        $current_date       = date('Y-m-d');
        $current_date_raker = date('Y-m-d H:i:s');

        $karyawan = Karyawan::where('api_token', $api_token)->firstOrFail();

        $absens = Absen::where('karyawan_id', $karyawan->karyawan_id)->where('tanggal', $current_date)->get();
        $rakers = Raker::where('tgl_hari_ini', $current_date)->where('karyawan_id', $karyawan->karyawan_id)->get();

        foreach($absens as $absen) {
            $absen->delete();
        }

        foreach($rakers as $raker) {
            $raker->delete();
        }
        
        return response()->json([
            'code'    => 200,
            'success' => (boolean) true,
            'message' => 'successfully, the employee absent has been deleted',
        ], 200); 
    }

    public function getRakerTodayByJobdesk($arr_rencana_kerja, $jobdesk_id, $karyawan)
    {
        $arr_rencana_kerja_valid = [];

        foreach($arr_rencana_kerja as $rencana_kerja) {
            if( $rencana_kerja['jobdesk_id'] == $jobdesk_id ) {
                $arr_rencana_kerja_valid[] = Raker::where('jobdesk_id', $jobdesk_id)->where('desk', $rencana_kerja['desk'])->where('status', $rencana_kerja['status'])->where('karyawan_id', $karyawan->karyawan_id)->firstOrFail();
            }
        }

        return $arr_rencana_kerja_valid;
    }
}
