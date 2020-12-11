<?php

namespace App\Http\Controllers\v2;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;

class KaryawanController extends Controller
{
    public function index(Request $request)
    {

        $api_token = request('api_token');

        $karyawan = DB::table('employees')
                            ->join('school', 'employees.school_id', '=' , 'school.id')
                            ->leftJoin('position', 'employees.position_id', '=', 'position.id')
                            ->join('cabang', 'employees.cabang_id', '=' ,'cabang.id')
                            ->join('schedules', 'employees.schedule_id', '=' ,'schedules.id')
                            ->join('status', 'employees.status_id', '=' ,'status.id')
                            ->join('status', 'employees.status_id', '=' ,'status.id')

                            ->select('employees.*', 'position.description' ,'school.school_name','cabang.namanya', 'schedules.time_in', 'schedules.time_out','status.jenis')
                            ->where('api_token', $api_token)
                            ->get();

        if ($karyawan === 0) {
            return response()->json([
                "code"      => 400,
                "success"   => false,
                "message"   => "data tidak ditemukan, anda harus login terlebih dahulu",
            ], 400);
        }else {
            return response()->json([
                "code"      => 200,
                "success"   => true,
                "message"   => "success",
                "data"      =>  [
                                'employees' => $karyawan 
                            ]
            ], 200);
        }
    }
}
