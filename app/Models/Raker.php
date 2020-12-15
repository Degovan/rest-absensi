<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Raker extends Model
{
    protected $table = 'raker';

    protected $fillable = ['karyawan_id', 'title', 'desk', 'tgl_mulai', 'tgl_selesai', 'status', 'note', 'solusi', 'photo', 'nilai'];

    public $timestamps = false;
}
