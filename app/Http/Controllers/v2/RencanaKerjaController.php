<?php

namespace App\Http\Controllers\v2;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Models\Raker;
use App\Models\Karyawan;

class RencanaKerjaController extends Controller
{
    public function getRakerHariIni(Request $request)
    {
        $api_token              = $request->api_token;
        $current_date           = date('Y-m-d');
        $karyawan               = Karyawan::where('api_token', $api_token)->firstOrFail();
        $raker_today            = Raker::where('tgl_mulai', $current_date)->where('karyawan_id', $karyawan->karyawan_id)->get();
        
        if( count($raker_today) == 0 ) {
            return response()->json([
                'code'      => 404,
                'success'   => (boolean) false,
                'message'   => 'rencana kerja hari ini tidak ada, anda belum melakukan absen',
            ], 404);
        } else {
            return response()->json([
                'code'      => 200,
                'success'   => (boolean) true,
                'message'   => 'successfully, mendapatkan rencana kerja hari ini',
                'data'      => [
                    'rencana_kerja' => $raker_today
                ]
            ]);
        }
    }
}
