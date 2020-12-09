<?php

namespace App\Http\Controllers;

use App\InformasiUmum;
use Illuminate\Http\Request;

class InformasiUmumSchoolController extends Controller
{
    public function show($school_id)
    {
        $informasi = InformasiUmum::where("school_id", $school_id)->get();

        return response()->json($informasi);
    }
}