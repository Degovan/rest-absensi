<?php

namespace App\Http\Controllers\v2;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Karyawan;

class KaryawanController extends Controller
{
    public function index(Request $request)
    {
        $api_token = request('api_token');
        $karyawan = Karyawan::with(['perusahaan'])->where('api_token', $api_token)->firstOrFail();

        return response()->json([
            'code'      => 200,
            'success'   => (boolean) true,
            'message'   => 'successfully, employee data found',
            'data'      =>  [
                            'karyawan' => $karyawan
                        ]
        ], 200);
    }
}
