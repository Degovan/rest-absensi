<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Raker extends Model
{
    protected $primaryKey = 'raker_id';
    protected $table = 'raker';

    protected $fillable = ['karyawan_id', 'title', 'desk', 'tgl_mulai', 'tgl_selesai', 'status', 'note', 'solusi', 'photo', 'nilai', 'jobdesk_id'];

    public $timestamps = false;
}
