<?php

namespace App\Http\Controllers\v2;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Models\Raker;
use App\Models\Jobdesk;
use App\Models\Karyawan;
use App\Models\DetailJobdesk;
use App\Models\Absen;

class RencanaKerjaController extends Controller
{
    public function getRakerHariIni(Request $request)
    {
        
        $api_token              = $request->api_token;
        $current_date           = date('Y-m-d');
        $karyawan               = Karyawan::where('api_token', $api_token)->firstOrFail();
        $jobdesks               = DetailJobdesk::where('karyawan_id', $karyawan->karyawan_id)->orderBy('detail_jobdesk_id', 'DESC')->get();

        $list_jobdesk = [];
        foreach($jobdesks as $jobdesk) {
            $list_jobdesk[] = [
                'jobdesk_id'        => $jobdesk->jobdesk_id,
                'jobdesk'           => $jobdesk->jobdesk->name,
                'rencana_kerja'     => $this->getRaker($jobdesk->jobdesk_id, $karyawan, $current_date),
            ];
        }
        
        if( Absen::where('karyawan_id', $karyawan->karyawan_id)->count() < 1 ) {
            return response()->json([
                'code'      => 200,
                'success'   => (boolean) true,
                'data'      => [
                    'status_absen'  => false,
                    'jobdesk'       => $list_jobdesk
                ],
            ], 200);
        } else {
            return response()->json([
                'code'      => 200,
                'success'   => (boolean) true,
                'data'      => [
                    'status_absen'  => Absen::where('karyawan_id', $karyawan->karyawan_id)->orderBy('tanggal', 'DESC')->firstOrFail()->tanggal == $current_date,
                    'jobdesk'       => $list_jobdesk
                ],
            ], 200);
        }
        
        
        
        return response()->json([
            
            'message'   => 'successfully, mendapatkan rencana kerja hari ini',
            'data'      => [

                'jobdesk' => $list_jobdesk
            ]
        ], 200);
    }

    public function getRaker($jobdesk_id, $karyawan, $current_date)
    {
        if( Raker::where('jobdesk_id', $jobdesk_id)->where('karyawan_id', $karyawan->karyawan_id)->where('tgl_hari_ini', $current_date)->count() > 0 ) {
            return Raker::where('jobdesk_id', $jobdesk_id)->where('karyawan_id', $karyawan->karyawan_id)->where('tgl_hari_ini', $current_date)->get();
        } else if( Raker::where('jobdesk_id', $jobdesk_id)->where('karyawan_id', $karyawan->karyawan_id)->where('status', 'progress')->orderBy('tgl_mulai', 'DESC')->count() > 0 ) {
            return Raker::where('jobdesk_id', $jobdesk_id)->where('karyawan_id', $karyawan->karyawan_id)->where('status', 'progress')->orderBy('tgl_mulai', 'DESC')->get();
        } else {
            return [];
        }
    }
}


