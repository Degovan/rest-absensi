<?php

namespace App\Http\Controllers\v2\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Hash;
use DB;

use App\User;

class KaryawanController extends Controller
{
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'school_id'     => 'required|numeric',
            'firstname'     => 'required|max:50',
            'lastname'      => 'required|max:50',
            'address'       => 'required|max:100',
            'birthdate'     => 'required|date',
            'tgl_masuk'     => 'required|date',
            'contact_info'  => 'required|max:100',
            'noktp'         => 'required|max:100',
            'nik'           => 'required|numeric',
            'gaji_pokok'    => 'required|numeric',
            'pendidikan'    => 'required|max:100',
            'domisi'        => 'required|max:100',
            'gender'        => 'required|max:10',
            'position_id'   => 'required|numeric',
            'hpsodara'      => 'required|max:100',
            'namaso'        => 'required|max:100',
            'namaso'        => 'required|max:100',
            'namaso'        => 'required|max:100',
            'namaso'        => 'required|max:100',
            'namaso'        => 'required|max:100',
            'namaso'        => 'required|max:200',
            'created_on'    => 'sometimes|date',
            'password'      => 'required|max:100',
            'email'         => 'required|max:50|unique:employees',
            'active'        => 'required|max:1',
            'photo'         => 'required',
        ]);

        if( $validator->fails()) {
            return response()->json([
                'code'      => 401,
                'success'   => (boolean) false,
                'message'   => "Error, doesn't pass validation",
                "data"      => [
                    'old_value'         => $request->all(),
                    'errors_message'    => $validator->errors()
                ]
            ], 200);
        }

        $employee_id = $this->generateEmployeeId(3, 9);
        $error_foreign = $this->validateForeign([
            'school'        => $request->school_id,
            'position'      => $request->position_id,
            'schedules'     => $request->schedule_id,
            'jadwals'       => $request->jadwal_id,
            'cabang'        => $request->cabang_id,
            'status'        => $request->status_id, 
        ]);

        if( $error_foreign ) {
            return response()->json([
                'code'      => 401,
                'success'   => (boolean) false,
                'message'   => $error_foreign,
                'data'      => [
                    'old_value'     => $request->all(),
                ],
            ], 200);
        }

        $employee = User::create([
            'employee_id'   => $employee_id,
            'school_id'     => $request->school_id,
            'firstname'     => $request->firstname,
            'lastname'      => $request->lastname,
            'address'       => $request->address,
            'birthdate'     => $request->birthdate,
            'tgl_masuk'     => $request->tgl_masuk,
            'contact_info'  => $request->contact_info,
            'noktp'         => $request->noktp,
            'nik'           => $request->nik,
            'gaji_pokok'    => $request->gaji_pokok,
            'pendidikan'    => $request->pendidikan,
            'domisi'        => $request->domisi,
            'gender'        => $request->gender,
            'position_id'   => $request->position_id,
            'hpsodara'      => $request->hpsodara,
            'namaso'        => $request->namaso,
            'alamat'        => $request->alamat,
            'bank'          => $request->bank,
            'norek'         => $request->norek,
            'namab'         => $request->namab,
            'created_on'    => $request->created_on,
            'password'      => Hash::make($request->password),
            'email'         => $request->email,
            'active'        => $request->active,
            'photo'         => $request->photo,
            'jadwal_id'     => $request->jadwal_id,
            'cabang_id'     => $request->cabang_id,
            'status_id'     => $request->status_id,
            'schedule_id'   => $request->schedule_id,
        ]);

        return response()->json([
            'code'      => 200,
            'success'   => (boolean) true,
            'message'   => 'successfully, Employee has been created',
            'data'      => [
                'employee'   => User::where('employee_id', $employee_id)->first(),
            ]
        ], 200);
    }
    
    public function generateEmployeeId($str_length, $number_length)
    {
        $randLetter = $this->generateRandomStringByLetter($str_length);
        $randNumber  = $this->generateRandomStringByNumber($number_length);

        return $randLetter . $randNumber;
    }

    public function generateRandomStringByLetter($length) {
        $characters = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
        $charactersLength = strlen($characters);
        $randomString = '';
        for ($i = 0; $i < $length; $i++) {
            $randomString .= $characters[rand(0, $charactersLength - 1)];
        }
        return strtoupper($randomString);
    }

    public function generateRandomStringByNumber($length) {
        $characters = '0123456789';
        $charactersLength = strlen($characters);
        $randomString = '';
        for ($i = 0; $i < $length; $i++) {
            $randomString .= $characters[rand(0, $charactersLength - 1)];
        }
        return $randomString;
    }

    public function validateForeign($pair_arr)
    {
        foreach($pair_arr as $table_name => $id) {

            if( $id != '' && $id != null ) {
                $allData = DB::table($table_name)->get();

                $allDataIdFromTable = [];
                foreach($allData as $dataTable) {
                    $allDataIdFromTable[] = $dataTable->id;
                }
    
                if( !in_array($id, $allDataIdFromTable) ) {
                    return 'id yang anda kirimkan tidak cocok dengan data yang ada di tabel ' . $table_name;
                }
            }
        }
        return false;
    }
}
