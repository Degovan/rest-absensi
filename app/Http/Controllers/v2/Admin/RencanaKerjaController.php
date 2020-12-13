<?php

namespace App\Http\Controllers\v2\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

use App\Harian;

class RencanaKerjaController extends Controller
{
    public function index()
    {
        $allRencanaKerja = Harian::orderBy('id', 'DESC')->get();

        return response()->json([
            'code'      => 200,
            'success'   => (boolean) true,
            'message'   => 'successfully, retrieving all rencana kerja data',
            'data'      => [
                'rencana_kerja' => $allRencanaKerja,
            ]
        ], 200);
    }
}
