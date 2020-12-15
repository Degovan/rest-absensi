<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Absen extends Model
{
    protected $table = 'absen';

    protected $fillable = ['karyawan_id', 'status', 'alasan', 'photo', 'tanggal', 'jam_masuk', 'jam_pulang', 'lama_kerja'];

    public $timestamps = false;
}