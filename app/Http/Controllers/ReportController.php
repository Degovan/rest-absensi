<?php

namespace App\Http\Controllers;

use App\Ts;
use Carbon\Carbon;
use App\Attendance;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;

class ReportController extends Controller
{
    public function index()
    {
        
        $attendance = Attendance::
            where("employee_id", Auth::user()->id)
            ->orderBy("date", "desc")
            ->select("date")
            ->get();

        $result  = [];
        foreach($attendance as $item){
            $date = $item->date;
            $attendance2 = Attendance::
            with([
                "employe"   => function($q){
                    $q->select("id");
                },
                    "employe.ts" => function($q) use ($date) {
                    $q->orderBy("last_updated", "desc")
                    ->whereDate("last_updated" , $date)
                    ->get();
                }
            ])
            ->where("employee_id", Auth::user()->id)
            ->where("date", $date)
            ->first();
            
            array_push($result, $attendance2);
        }
        
            // "date": "2020-10-21",
            // "ts_date": "2020-10-30",

        // DB::table('attendances')
        //     ->join('employees', 'employee.id', '=', 'attendances.employee_id')
        //     ->join('ts', 'employee.id', '=', 'ts.employee_id')
        //     ->select('attendances.time_in', 'attendances.time_out', 'ts.tasks', 'ts.tasks_result')
        //     ->where("attendances.employee_id", Auth::user()->id)
        //     ->get();

        return response()->json([
            "code"      => 200,
            "message"   => "berhasil",
            "data"      => $result
        ]);
    }
}

// PRIMARY KEY, FOREIGN KEY
// FOREIGN