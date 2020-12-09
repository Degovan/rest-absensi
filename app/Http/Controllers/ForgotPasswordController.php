<?php

namespace App\Http\Controllers;

use App\User;
use Illuminate\Http\Request;

class ForgotPasswordController extends Controller
{
    public function forgot_password(Request $request)
    {
        // $user = User::where("email", $request->email)->firstOrFail();
        $user = User::where("employee_id", $request->employee_id)->first();

        if (empty($user)) {
            return response()->json([
                "msg"  => "pengguna belum terdaftar"
            ], 404);
        }

        return response()->json([
            "no_hp"  => $user->contact_info,
            // "email"  => $user->email
            "employee_id"  => $user->employee_id
        ]);
    }

    public function change_password(Request $request)
    {
        $this->validate($request , [
            // "email"                 => "required",
            "employee_id"           => "required",
            "password"              => "required|same:password",
            "password_confirmation" => "required|same:password"
        ]);

        // $user = User::where("email", $request->email)->firstOrFail();
        $user = User::where("employee_id", $request->employee_id)->first();

        if (empty($user)) {
            return response()->json([
                "msg"  => "pengguna belum terdaftar"
            ], 404);
        }

        $user->update([
            "password"  => bcrypt($request->password)
        ]);

        return response()->json([
            "data"  => $user
        ]);
    }
}
