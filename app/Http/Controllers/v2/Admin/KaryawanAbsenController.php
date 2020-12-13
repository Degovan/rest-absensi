<?php

namespace App\Http\Controllers\v2\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

use App\Attendance;

class KaryawanAbsenController extends Controller
{
    public function index()
    {
        return response()->json([
            'code'      => 200,
            'success'   => (boolean) true,
            'message'   => 'successfully, all data employee absence has retrieved',
            'data'      => [
                'attendance'  => Attendance::select('employees.employee_id', 'employees.firstname', 'employees.lastname', 'status.jenis as status_employee', 'attendance.status as status_absen', 'attendance.date as tanggal', 'attendance.time_in as jam_masuk', 'attendance.time_out as jam_pulang', 'attendance.num_hr as lama_kerja')
                                                ->join('employees', 'attendance.employee_id', '=', 'employees.id')
                                                ->join('status', 'employees.status_id', '=', 'status.id')
                                                ->orderBy('attendance.id', 'DESC')->get(),
                ]
            ], 200);
    }
}
