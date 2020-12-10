<?php

namespace App\Http\Controllers\v2;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

use App\User;
use App\Attendance;

class KaryawanAbsenController extends Controller
{
    private $time_out  = "17:00:00";
    private $time_in   = "08:05:00";

    public function store(Request $request)
    {
        // Absen 
        $api_token          = $request->api_token;
        $employee           = User::select(['id'])->where('api_token', $api_token)->get()[0];
        $current_date       = date('Y-m-d');
        $attendance_exists  = Attendance::where('employee_id', $employee->id)->where('date', $current_date)->count();
        
        if($attendance_exists > 0) {
            return response()->json([
                'code'    => 400,
                'message' => 'the employee has made an absence',
            ], 400);
        }

        $current_time   = date('H:i:s');
        $status         = $this->time_in >= $current_time;
        $telat          = ( !$status ) ? ( strtotime($current_time) - strtotime($this->time_in) ) / 60 : 0;

        $attendance = Attendance::create([
            'employee_id'   => $employee->id,
            'date'          => $current_date,
            'time_in'       => $current_time,
            'status'        => $this->time_in >= $current_time,
            'telat'         => $telat,
            'latitude'      => $request->latitude,
            'longitude'     => $request->longitude,
        ]);

        return response()->json($attendance, 200);
    }
}
