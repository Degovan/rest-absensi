<?php

namespace App\Http\Controllers\v2;

use Illuminate\Support\Facades\Validator;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Hash;
use DB;

use App\User;
use App\Models\Karyawan;

class AuthKaryawanController extends Controller
{
    public function login(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'kd_karyawan'       => 'required',
            'password'          => 'required',
        ], [
            'kd_karyawan.required'  => 'kode karyawan tidak boleh kosong',
            'password.required'     => 'password tidak boleh kosong',
        ]);

        if($validator->fails()) {
            return response()->json([
                'code'      => 401,
                'success'   => (boolean) false,
                'message'   => "error, doesn't pass validation",
                'data'      => [
                    'old_value'   => [
                        'kd_karyawan'     => $request->kd_karyawan,
                    ],
                    'errors_validation' => $validator->errors(),
                ]
            ], 401);
        }

        $credentials = ['kd_karyawan' => $request->kd_karyawan, 'password' => $request->password];
        if(Auth::guard('karyawan')->attempt($credentials)) {
            $karyawan = Karyawan::select('karyawan.*', 'perusahaan.name as nama_perusahaan')
                                ->join('perusahaan', 'karyawan.perusahaan_id', '=', 'perusahaan.perusahaan_id')
                                ->where('karyawan.kd_karyawan', '=', $request->kd_karyawan)
                                ->firstOrFail();
            $token      = Str::random(60);
            $updateApi = DB::statement("UPDATE karyawan set api_token = '$token' WHERE kd_karyawan = '$karyawan->kd_karyawan'");

            return response()->json([
                'code'      => 200,
                'success'   => (boolean) true,
                'token'     => $token,
                'message'   => 'successfully, karyawan has logged in',
                'data'  => [
                    'karyawan'  => $karyawan,
                ]
            ], 200);
        } else {
            return response()->json([
                'code'      => 400,
                'success'   => (boolean) false,
                'message'   => "error, Email and password don't match",
                'data'      => [
                    'old_value'  => [
                        'kd_karyawan'     => $request->kd_karyawan,
                    ]
                ]
            ], 400);
        }
    }

    public function logout(Request $request)
    {
        $api_token          = $request->api_token;
        $employee           = User::where('api_token', $api_token)->firstOrFail();

        $employee->update([
            'api_token'     => '',
        ]);

        return response()->json([
            'code'      => 200,
            'success'   => (boolean) true,
            'message'   => 'successfully, the employee has been logged out and api_token has been deleted',
        ], 200);
    }
}
