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

    public function absenMasuk(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'rencana_kerja'     => 'required|array',
        ], [
            'rencana_kerja.required'    => 'rencana kerja tidak boleh kosong',
            'rencana_kerja.array'       => 'rencana kerja harus bertipe data array',
        ]);

        if( $validator->fails() ) {
            return response()->json([
                'code'      => 401,
                'success'   => (boolean) false,
                'message'   => "error, doesn't pass validation",
                'data'    => [
                    'old_value'          => [
                        'rencana_kerja'     => $request->rencana_kerja,
                        'lt'                => $request->lt,
                        'lo'                => $request->lo,
                        'address'           => $request->address,
                    ],
                    'errors_validation'  => $validator->errors(),
                ],
            ], 401);
        }
        
        // Absen 
        $api_token          = $request->api_token;
        $employee           = User::where('api_token', $api_token)->get()[0];
        $current_date       = date('Y-m-d');
        $attendance_exists  = Attendance::where('employee_id', $employee->id)->where('date', $current_date)->count();

        if($attendance_exists > 0) {
            return response()->json([
                'code'    => 401,
                'success' => (boolean) false,
                'message' => 'error, the employee has made an absence',
            ], 401);
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
            'latitude'      => $request->lt,
            'longitude'     => $request->lo,
            'address'       => $request->address,
        ]);

        $rencana_kerja_obj = $this->storeRencanaKerja($request->rencana_kerja, $employee);

        return response()->json([
            'code'              => 200,
            'success'           => (boolean) true,
            'message'           => 'successfully, the employee has made an absence',
            'data'              => [
                'absen_harian'      => Attendance::find($attendance->id), 
                'rencana_kerja'     => Harian::find($rencana_kerja_obj->id),
            ]
        ], 200);
    }

    /**
     * Store rencana kerja
     *
     * @param array rencana_kerja
     */
    public function storeRencanaKerja($rencana_kerja_arr, $employee)
    {
        $current_date       = date('Y-m-d');

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
            'status'            => '-',
            'evaluasi'          => '-',
            'solusi'            => '-',
        ]);

        return $rencana_kerja_obj;
    }

    public function absenPulang(Request $request) 
    {
        $api_token          = $request->api_token;
        $employee           = User::where('api_token', $api_token)->get()[0];
        $current_date       = date('Y-m-d');
        $attendance         = Attendance::where('employee_id', $employee->id)->where('date', $current_date)->first();

        if( is_null($attendance) ) {
            return response()->json([
                'code'      => 404,
                'success'   => (boolean) false,
                'message'   => 'error, the employee has not been absent',
            ], 404);
        }

        $current_time   = date('H:i:s');
        $hour           = ( strtotime($current_time) - strtotime($attendance->time_in) ) / 3600;
        $minutes        = $hour * 60 % 60;

        $attendance->update([
            'time_out'  => $current_time,
            'num_hr'    => (double) floor($hour) . '.' . floor($minutes),
        ]);

        return response()->json([
            'code'      => 200,
            'success'   => (boolean) true,
            'message'   => 'successfully, the employee has made an absence return back to home',
            'data'      => [
                'employee'        => $employee,
                'absen_harian'    => $attendance,
            ],
        ]);
    }

    public function deleteAbsen(Request $request)
    {
        $api_token          = $request->api_token;
        $employee           = User::where('api_token', $api_token)->firstOrFail();
        $current_date       = date('Y-m-d');
        $attendance         = Attendance::where('employee_id', $employee->id)->where('date', $current_date)->first();

        if( is_null($attendance) ) {
            return response()->json([
                'code'      => 404,
                'success'   => (boolean) false,
                'message'   => 'error, the employee has not been absent',
            ], 404);
        }

        $attendance->delete();
        return response()->json([
            'code'    => 200,
            'success' => (boolean) true,
            'message' => 'successfully, the employee absent has been deleted',
        ]); 
    }
}
