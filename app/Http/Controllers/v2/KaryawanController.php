<?php

namespace App\Http\Controllers\v2;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\User;

class KaryawanController extends Controller
{
    public function index(Request $request)
    {
        $api_token = request('api_token');
        $karyawan = User::with(['school', 'position', 'schedule', 'jadwal', 'cabang', 'status'])->where('api_token', $api_token)->get();

        return response()->json([
            'code'      => 200,
            'success'   => (boolean) true,
            'message'   => 'successfully, employee data found',
            'data'      =>  [
                            'employee' => $karyawan
                        ]
        ], 200);
    }
}
