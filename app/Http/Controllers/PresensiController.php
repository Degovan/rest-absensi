<?php

namespace App\Http\Controllers;

use Auth;
use App\Ts;
use App\User;
use App\Attendance;
use App\RencanaKerja;
use Illuminate\Http\Request;
use Illuminate\Database\Eloquent\Builder;

class PresensiController extends Controller
{

    public function presensi()
    {
        $user = User::with(["school", "ts" => function($q) {
            $q->where("task_status", "=", "on progress");
        }])->where("id", Auth::user()->id)->firstOrFail();

        return response()->json([
            "code"  => 200,
            "data"  => $user    
        ]);
    }

    /**
     * ini fungsi untuk mendapatkan data user yang sedang login
     */
    public function masuk()
    {

        /**
         * uji apakah user udah login
         */

        $attendance = Attendance::where("date", date("Y-m-d"))
                    ->where("employee_id", Auth::user()->id)
                    ->where("time_in", "!=", null)
                    ->first();

        if(!empty($attendance)){
            return response()->json([
                "code"      => 302,
                "message"   => "anda sudah mengisi presensi masuk"
            ]);
        }
            

        /** 
         * with digunakan untuk memakai relasi apa aja 
         * bisa dicheck dimodel User
         */
        $user = User::with([
            
            "school", "position", "schedule", "jadwal", "cabang" , "status"
            
            ])->findOrFail(Auth::user()->id);

        return response()->json([
            "code"  => 200,
            "data"  => $user
            
        ]);
    }

    /**
     * ini fungsi untuk mengirim presensi masuk
     */
    public function storeMasuk(Request $request)
    {
        /**
         * parameter
         * 
         * 
         */

        $attendance = Attendance::where("date", date("Y-m-d"))
                    ->where("employee_id", Auth::user()->id)
                    ->where("time_in", "!=", null)
                    ->first();

        if(!empty($attendance)){
            return response()->json([
                "code"      => 302,
                "message"   => "anda sudah mengisi presensi masuk"
            ]);
        }

        $user = User::findOrFail(Auth::user()->id);

        /**
         * penampungan nilai attendance
         */
        
        $attendance = new Attendance([
            "date"          => now(),
            "time_in"       => now(),
            "status"        => 1,
            // "time_out"      => "00:00:00",
            "time_out"      => now(),
            "num_hr"        => 0,
            "telat"         => 0,
            "latitude"      => $request->latitude,
            "longitude"     => $request->longitude
        ]);
  
        /**
         * update ts
         */
        $ts = Ts::findOrFail($request->ts_id);

        $ts->update([
            // "ts_start"    => null,
            // "ts_end"      => null,
            "location"    => $request->location,
            "task_status" => $request->status,
            "task_plan"   => $request->task_plan
            // field rencana kerja belum
        ]);

        /**
         * insert ke attendance
         */
        $user->attendance()->save($attendance);
        // $user->ts()->save($attendance);
        
        /**
         * insert ke rencana kerja
         */
        foreach($request->rencana as $rencana){
            RencanaKerja::create([
                "employee_id"   => Auth::user()->id,
                "attendance_id" => $attendance->id,
                "task_plan"     => $rencana[0],
                "status"        => $rencana[1]
            ]);
        }
          
        return response()->json([
            "code"      => 200,
            "message"   => "tugas berhasil diisi",
            "data"  => $user
        ]);

    }
    
    /**
     * 
     */
    public function pulang()
    {
        $attendance = Attendance::where("date", date("Y-m-d"))
                    ->where("employee_id", Auth::user()->id)
                    ->where("time_out", "!=", "00:00:00")
                    ->first();

        if(!empty($attendance)){
            return response()->json([
                "code"      => 302,
                "message"   => "anda sudah mengisi presensi pulang"
            ]);
        }


        $ts = Ts::with(["employee", "employee.attendance" => function($q){
            $q->orderBy("date", "desc")->first();
        }])
        ->where("emp_id", Auth::user()->id)
        ->whereDay("ts_date", date("d"))
        ->firstOrFail();

        return response()->json([
            "code"  => 200,
            "data"  => $ts
        ]);
    }

    public function storePulang(Request $request)
    {
        $attendance = Attendance::where("date", date("Y-m-d"))
                    ->where("employee_id", Auth::user()->id)
                    ->where("time_out", "!=", "00:00:00")
                    ->first();

        if(!empty($attendance)){
            return response()->json([
                "code"      => 302,
                "message"   => "anda sudah mengisi presensi pulang"
            ], 302);
        }


        $attendance2 = Attendance::where("date", date("Y-m-d"))
            ->where("employee_id", Auth::user()->id)
            ->first();

        if (empty($attendance2)) {
            return response()->json([
                "code"      => 404,
                "message"   => "anda belum mengisi presensi masuk"
            ], 404);
        }

        $ts = Ts::where("ts_id", $request->ts_id)->first();

        if (empty($ts)) {
            return response()->json([
                "code"      => 404,
                "message"   => $request->all()
            ], 404);
        }

        $attendance2->update([
            "time_out" => now()
        ]);

        $ts->update([
            "task_status"       => $request->status,
        ]);

        /**
         * insert ke rencana kerja
         */
        foreach($request->rencana as $rencana){

            $r = RencanaKerja::where("id", $rencana[0])->firstOrFail();

            $r->update([
                "status"        => $rencana[1],
                "task_result"   => $rencana[2],
            ]);

        }

        return response()->json([
            "code"      => 200,
            "message"   => "berhasil mengisi presensi"
        ]);
    }

}
