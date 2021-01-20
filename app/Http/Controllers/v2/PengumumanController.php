<?php

namespace App\Http\Controllers\v2;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

use App\Models\Pengumuman;
use App\Models\Karyawan;

class PengumumanController extends Controller
{
    public function getPengumuman(Request $request)
    {
        
        $api_token = $request->api_token;
        
        $karyawan  = Karyawan::where('api_token', $api_token)->firstOrFail();
        $current_date       = date('Y-m-d');
        
        $pengumuman = Pengumuman::where('perusahaan_id', $karyawan->perusahaan_id)
                ->where('start_date', '<=', $current_date)
                ->where('end_date', '>=', $current_date)
                ->orderBy('end_date', 'ASC')
                ->get();
                
        return response()->json([
            'code'      => 200,
            'success'   => (boolean) true,
            'data'      => [
                'pengumuman'  => $pengumuman
            ],
        ], 200);
    }
}
