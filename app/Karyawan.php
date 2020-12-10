<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Karyawan extends Model
{
    protected $table = 'employees';

    protected $gurded = [];

    public $timestamps = false;
}
