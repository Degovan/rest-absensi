<?php

namespace App\Http\Controllers\v2;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Karyawan;

class KaryawanController extends Controller
{
    public function index(Request $request)
    {
        $karyawan = Karyawan::get();
        if ($karyawan === 0) {
            return response()->json([
                "msg"   => "success",
                "code"  => 400,
            ], 400);
        }else {
            return response()->json([
                "msg"   => "success",
                "code"  => 200,
                "data"  => $karyawan
            ], 200);
        }
    }
}
