<?php

namespace App\Http\Controllers\v2;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

use App\Models\Karyawan;
use App\Models\Absen;
use App\Models\Raker;

class KaryawanAbsenController extends Controller
{

    public function absenMasuk(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'rencana_kerja'     => 'required|array',
        ], [
            'rencana_kerja.required'    => 'rencana kerja tidak boleh kosong',
            'rencana_kerja.array'       => 'rencana kerja harus bertipe data array',
        ]);

        if( $validator->fails() ) {
            return response()->json([
                'code'      => 401,
                'success'   => (boolean) false,
                'message'   => "error, doesn't pass validation",
                'data'    => [
                    'old_value'          => [
                        'rencana_kerja'     => $request->rencana_kerja,
                        'lt'                => $request->lt,
                        'lo'                => $request->lo,
                        'address'           => $request->address,
                        'hasil_kerja'       => $request->hasil_kerja
                    ],
                    'errors_validation'  => $validator->errors(),
                ],
            ], 401);
        }
        
        // Absen 
        $api_token          = $request->api_token;
        $karyawan           = Karyawan::where('api_token', $api_token)->get()[0];
        $current_date       = date('Y-m-d');
        $attendance_exists  = Absen::where('karyawan_id', $karyawan->id)->where('tanggal', $current_date)->count();

        if($attendance_exists > 0) {
            return response()->json([
                'code'    => 401,
                'success' => (boolean) false,
                'message' => 'error, karyawan has made an absence',
            ], 401);
        }

        $current_time   = date('H:i:s');

        $rencana_kerja_obj = $this->storeRencanaKerja($request->rencana_kerja, $karyawan);
        return response()->json([$rencana_kerja_obj]);
        if(!$rencana_kerja_obj) {
            return response()->json([
                'code'    => 401,
                'success' => (boolean) false,
                'message' => 'rencana kerja must be array of object and have key : text & status',
                'data'    => [
                    'old_value'          => [
                        'rencana_kerja'     => $request->rencana_kerja,
                        'lt'                => $request->lt,
                        'lo'                => $request->lo,
                        'address'           => $request->address,
                        'hasil_kerja'       => $request->hasil_kerja,     
                    ],
                ]
            ], 401);
        }


        $attendance = Absen::create([
            'karyawan_id'   => $karyawan->id,
            'status'        => 'ok',
            'alasan'        => 'ini alasan',
            'photo'         => 'ini photo',
            'tanggal'       => $current_date,
            'jam_masuk'     => $current_time,
        ]);

        return response()->json([
            'code'              => 200,
            'success'           => (boolean) true,
            'message'           => 'successfully, the employee absence has been created',
            'data'              => [
                'absen_harian'      => Attendance::find($attendance->id), 
                'rencana_kerja'     => Raker::where('date_harian', $current_date)->where('employee_id', $employee->id)->get(),
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

        if(gettype($rencana_kerja_arr[0]) != 'array') {
            return false;
        }

        foreach($rencana_kerja_arr as $rencana_kerja) {
            if(!array_key_exists('text', $rencana_kerja) && !array_key_exists('status', $rencana_kerja)) {
                return false;
            }
        }

        $arr_rencana_kerja_obj = [];

        foreach($rencana_kerja_arr as $rencana_kerja) {
            $arr_rencana_kerja_obj[] = Raker::create([
                'karyawan_id'       => $karyawan->karyawan_id,
                'title'             => $rencana_kerja['text'],
                'desk'              => $rencana_kerja['deskripsi'],
                'tgl_mulai'         => $current_date,
                'tgl_selesai'       => $current_date,
                'status'            => $rencana_kerja['status'],
                'note'              => 'ok',
                'solusi'            => 'ini solusi',
                'photo'             => 'ini photo',
                'nilai'             => 5,
            ]);
        }

        return $arr_rencana_kerja_obj;
    }

    public function absenPulang(Request $request) 
    {
        $validator = Validator::make($request->all(), [
            'rencana_kerja'     => 'required|array',
        ], [
            'rencana_kerja.required'    => 'rencana kerja tidak boleh kosong',
            'rencana_kerja.array'       => 'rencana kerja harus bertipe data array',
        ]);

        if( $validator->fails() ) {
            return response()->json([
                'code'      => 401,
                'success'   => (boolean) false,
                'message'   => "error, doesn't pass validation",
                'data'    => [
                    'old_value'          => [
                        'rencana_kerja'     => $request->rencana_kerja,
                        'lt'                => $request->lt,
                        'lo'                => $request->lo,
                        'address'           => $request->address,
                        'hasil_kerja'       => $request->hasil_kerja
                    ],
                    'errors_validation'  => $validator->errors(),
                ],
            ], 401);
        }

        if(gettype($request->rencana_kerja[0]) != 'array') {
            return response()->json([
                'code'    => 401,
                'success' => (boolean) false,
                'message' => 'rencana kerja must be array of object and have key : text & status',
                'data'    => [
                    'old_value'          => [
                        'rencana_kerja'     => $request->rencana_kerja,
                        'lt'                => $request->lt,
                        'lo'                => $request->lo,
                        'address'           => $request->address,
                        'hasil_kerja'       => $request->hasil_kerja,     
                    ],
                ]
            ], 401);
        }

        foreach($request->rencana_kerja as $rencana_kerja) {
            if(!array_key_exists('text', $rencana_kerja) && !array_key_exists('status', $rencana_kerja)) {
                return response()->json([
                    'code'    => 401,
                    'success' => (boolean) false,
                    'message' => 'rencana kerja must be array of object and have key : text & status',
                    'data'    => [
                        'old_value'          => [
                            'rencana_kerja'     => $request->rencana_kerja,
                            'lt'                => $request->lt,
                            'lo'                => $request->lo,
                            'address'           => $request->address,
                            'hasil_kerja'       => $request->hasil_kerja,     
                        ],
                    ]
                ], 401);
            }
        }

        $api_token          = $request->api_token;
        $employee           = Karyawan::where('api_token', $api_token)->get()[0];
        $current_date       = date('Y-m-d');
        $attendance         = Attendance::where('employee_id', $employee->id)->where('date', $current_date)->first();

        if( is_null($attendance) ) {
            return response()->json([
                'code'      => 404,
                'success'   => (boolean) false,
                'message'   => 'error, the employee has not been absent',
            ], 404);
        }

        $current_time   = date('H:i:s');
        $hour           = ( strtotime($current_time) - strtotime($attendance->time_in) ) / 3600;
        $minutes        = $hour * 60 % 60;

        $attendance->update([
            'time_out'      => $current_time,
            'num_hr'        => (double) floor($hour) . '.' . floor($minutes),
        ]);

        $rencana_kerja_db_arr = Harian::where('date_harian', $current_date)->where('employee_id', $employee->id)->get();

        foreach($rencana_kerja_db_arr as $rencana_kerja_db) {
            $rencana_kerja_db->delete();
        }

        foreach($request->rencana_kerja as $rencana_kerja) {
            $rencana_kerja_obj = Raker::create([
                'date_harian'       => $current_date,
                'employee_id'       => $employee->id,
                'school_id'         => $employee->school_id,
                'cabang_id'         => $employee->cabang_id,
                'lokasi_id'         => 1,
                'jabker_id'         => 1,
                'nohp'              => $employee->contact_info,
                'job'               => $employee->position->description,
                'position_id'       => $employee->position_id,
                'renke'             => $rencana_kerja['text'],
                'status'            => $rencana_kerja['status'],
                'evaluasi'          => '-',
                'solusi'            => '-',
                'hasil_kerja'       => $request->hasil_kerja,
            ]);
        }

        return response()->json([
            'code'      => 200,
            'success'   => (boolean) true,
            'message'   => 'successfully, the employee has made an absence return back to home',
            'data'      => [
                'employee'        => $employee,
                'absen_harian'    => $attendance,
                'rencana_kerja'   => Harian::where('date_harian', $current_date)->where('employee_id', $employee->id)->get(),
            ],
        ], 200);
    }

    public function deleteAbsen(Request $request)
    {
        $api_token          = $request->api_token;
        $employee           = Karyawan::where('api_token', $api_token)->firstOrFail();
        $current_date       = date('Y-m-d');
        $attendance         = Attendance::where('employee_id', $employee->id)->where('date', $current_date)->first();

        if( is_null($attendance) ) {
            return response()->json([
                'code'      => 404,
                'success'   => (boolean) false,
                'message'   => 'error, the employee has not been absent',
            ], 404);
        }
        $attendance->delete();
        
        $rencana_kerja_db_arr = Harian::where('date_harian', $current_date)->where('employee_id', $employee->id)->get();

        foreach($rencana_kerja_db_arr as $rencana_kerja_db) {
            $rencana_kerja_db->delete();
        }
        
        return response()->json([
            'code'    => 200,
            'success' => (boolean) true,
            'message' => 'successfully, the employee absent has been deleted',
        ], 200); 
    }
}
