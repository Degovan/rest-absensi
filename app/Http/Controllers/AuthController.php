<?php

namespace App\Http\Controllers;

use Auth;
use App\User;
use App\Admin;
use Illuminate\Support\Str;
use Illuminate\Http\Request;

class AuthController extends Controller
{
    public function login(Request $request)
    {
        /**
         * parameter email
         */
        // $credentials = $request->only('email', 'password');
        
        /**
         * parameter employe id
         */
        $credentials = $request->only('employee_id', 'password');
        if (Auth::attempt($credentials)) {
            
            $user = User::with(["school"])->where("employee_id", $request->employee_id)->firstOrFail();
            // $user = User::with(["school"])->where("email", $request->email)->firstOrFail();

            $token = Str::random(60);

            $user->update([
                'api_token' => $token,
            ]);

            return response()->json([
                "code"  => 200,
                "token" => $token,
                "data"  => $user
            ]);
        }else{
            return response()->json([
                "code"      => 400,
                "status"    => "kredensial ada yang salah"
            ]);
        }
    }




    public function loginAdmin(Request $request)
    {
        $credentials = $request->only('username', 'password');

        if (auth()->guard('admin')->attempt($credentials)) {

            $user = Admin::where("username", $request->username)->firstOrFail();

            $token = Str::random(60);

            $user->update([
                'api_token' => $token,
            ]);

            return response()->json([
                "code"  => 200,
                "token" => $token,
                "data"  => $user
            ]);
        }else{
            return response()->json([
                "code"      => 400,
                "status"    => "kredensial ada yang salah"
            ]);
        }
    }
}
