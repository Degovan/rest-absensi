<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class JobDesk extends Model
{
    protected $table = 'jobdesk';

    protected $fillable = ['karyawan_id', 'job_desk'];
}
