<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Harian extends Model
{
    protected $table = 'harian';
    public $timestamps = false;

    protected $fillable = ['date_harian', 'employee_id', 'school_id', 'cabang_id', 'position_id', 'lokasi_id', 'jabker_id', 'nohp', 'job', 'renke', 'status', 'evaluasi', 'solusi', 'latitude', 'longitude', 'address', 'hasil_kerja'];
}
