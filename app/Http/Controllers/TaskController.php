<?php

namespace App\Http\Controllers;

use App\Ts;
use Illuminate\Http\Request;

class TaskController extends Controller
{
    // public function __construct()
    // {
    //     $this->middleware('guest:admin');
    // }

    public function store(Request $request)
    {
        for ($i=0; $i < count($request->tasks); $i++) { 
            Ts::create([
                "project_id"    => 0,
                "emp_id"       => $request->employee_id,
                "ts_date"           => $request->waktu,
                "tasks"             => $request->tasks[$i],
                "task_plan"             => $request->tasks[$i]
            ]);
        }

        return response()->json([
            "code"      => 200,
            "message"   => "berhasil mengirimkan tugas ke employee"
        ]);
        
    }
}
