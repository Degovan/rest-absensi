<?php

namespace App\Http\Controllers\v2;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

use App\User;
use App\Harian;
use App\Attendance;

class KaryawanAbsenController extends Controller
{
    private $time_out  = "17:00:00";
    private $time_in   = "08:05:00";
    private $employee;

    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'rencana_kerja'     => 'required',
        ], [
            'latitude.required'         => 'latitude tidak boleh kosong',
            'longitude.required'        => 'longitude tidak boleh kosong',
            'rencana_kerja.required'    => 'rencana_kerja tidak boleh kosong',
        ]);

        if( $validator->fails() ) {
            return response()->json([
                'code'      => 401,
                'message'   => 'Error validation',
                'errors'    => $validator->errors(),
            ], 401);
        }
        
        // Absen 
        $api_token          = $request->api_token;
        $employee           = User::where('api_token', $api_token)->get()[0];
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
        $this->employee = $employee;

        $attendance = Attendance::create([
            'employee_id'   => $employee->id,
            'date'          => $current_date,
            'time_in'       => $current_time,
            'status'        => $this->time_in >= $current_time,
            'telat'         => $telat,
            'latitude'      => $request->latitude,
            'longitude'     => $request->longitude,
            'address'       => $request->address,
        ]);

        $rencana_kerja_obj = $this->storeRencanaKerja($request->rencana_kerja);

        return response()->json([
            'code'              => 200,
            'absen_harian'      => Attendance::find($attendance->id), 
            'rencana_kerja'     => Harian::find($rencana_kerja_obj->id),
        ], 200);
    }

    /**
     * Store rencana kerja
     *
     * @param array rencana_kerja
     */
    public function storeRencanaKerja($rencana_kerja_arr)
    {
        $current_date       = date('Y-m-d');
        $employee           = $this->employee;

        $rencana_kerja_obj = Harian::create([
            'date_harian'       => $current_date,
            'employee_id'       => $employee->id,
            'school_id'         => $employee->school_id,
            'cabang_id'         => $employee->cabang_id,
            'lokasi_id'         => 1,
            'jabker_id'         => 1,
            'nohp'              => $employee->contact_info,
            'job'               => $employee->position->description,
            'position_id'       => $employee->position_id,
            'renke'             => json_encode($rencana_kerja_arr),
            'status'            => 'on-progress',
            'evaluasi'          => '-',
            'solusi'            => '-',
        ]);

        return $rencana_kerja_obj;
    }
}
