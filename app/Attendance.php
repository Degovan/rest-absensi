<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Attendance extends Model
{

    protected $table = "attendance";

    public $timestamps = false;

    protected $guarded = [];

    public function employe()
    {
        return $this->belongsTo(User::class, "employee_id", "id");
    }
}
