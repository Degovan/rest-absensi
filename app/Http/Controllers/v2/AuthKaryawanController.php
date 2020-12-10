<?php

namespace App\Http\Controllers\v2;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;

use App\User;

class AuthKaryawanController extends Controller
{
    public function login(Request $request)
    {
        $credentials = $request->only('email', 'password');
        if(Auth::attempt($credentials)) {
            $user = User::with(["school"])->where("email", $request->email)->firstOrFail();

            $token = Str::random(60);

            $user->update([
                'api_token' => $token,
            ]);

            return response()->json([
                "code"  => 200,
                "token" => $token,
                "data"  => $user
            ], 200);
        }

        return response()->json([
            "code"      => 400,
            "status"    => "credentials are wrong"
        ], 400);
    }
}
