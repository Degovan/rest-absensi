<?php

namespace App\Http\Middleware;

use Illuminate\Support\Facades\Validator;

use Closure;
use App\Models\Karyawan;

class AuthApiToken
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        // Check token is required
        $validator = Validator::make($request->all(), [
            'api_token' => 'required'
        ]);

        if($validator->fails()) {
            return response()->json([
                'code'    => 401,
                'success' => (boolean) false,
                'message' => 'api token is required',
            ], 200);
        }

        // Check token is match 
        $api_token = $request->api_token;
        $employee = Karyawan::select(['karyawan_id'])->where('api_token', $api_token)->get();

        if($employee->count() < 1) {
            return response()->json([
                'code'      => 401,
                'success'   => (boolean) false,
                'message'   => 'api token is invalid',
            ], 200);
        }

        return $next($request);
    }
}
