<?php

namespace App\Http\Controllers\v2;

use Illuminate\Support\Facades\Validator;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use Illuminate\Support\Str;

use App\User;

class AuthKaryawanController extends Controller
{
    public function login(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'email'     => 'required',
            'password'  => 'required',
        ], [
            'email.required'    => 'email tidak boleh kosong',
            'password.required' => 'password tidak boleh kosong',
        ]);

        if($validator->fails()) {
            return response()->json([
                'code'      => 401,
                'success'   => (boolean) false,
                'message'   => "error, doesn't pass validation",
                'data'      => [
                    'old_value'   => [
                        'email'     => $request->email,
                    ],
                    'errors_validation' => $validator->errors(),
                ]
            ], 401);
        }

        $credentials = $request->only('email', 'password');
        if(Auth::attempt($credentials)) {
            $employee   = User::with(['school'])->where('email', $request->email)->firstOrFail();
            $token      = Str::random(60);

            $employee->update([
                'api_token' => $token,
            ]);

            return response()->json([
                'code'      => 200,
                'success'   => (boolean) true,
                'token'     => $token,
                'message'   => 'successfully, employee has logged in',
                'data'  => [
                    'employee'  => $employee,
                ]
            ], 200);
        } else {
            return response()->json([
                'code'      => 400,
                'success'   => (boolean) false,
                'message'   => "error, Email and password don't match",
                'data'      => [
                    'old_value'  => [
                        'email'  => $request->email,
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
