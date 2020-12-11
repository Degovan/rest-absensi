<?php

namespace App\Http\Controllers\v2;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Karyawan;

class KaryawanController extends Controller
{
    public function index(Request $request)
    {

        $api_token = request('api_token');
        $karyawan = Karyawan::where('api_token', $api_token)->get()[0];

        if ($karyawan === 0) {
            return response()->json([
                "code"      => 400,
                "success"   => false,
                "message"   => "data tidak ditemukan, anda harus login terlebih dahulu",
            ], 400);
        }else {
            return response()->json([
                "code"      => 200,
                "success"   => true,
                "message"   => "success",
                "data"      =>  [
                                'employees' => $karyawan
                            ]
            ], 200);
        }
    }
}
