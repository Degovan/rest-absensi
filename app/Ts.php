<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Ts extends Model
{
    protected $table = "ts";

    protected $primaryKey = "ts_id";

    public $timestamps = false;

    protected $guarded = [];

    public function employee()
    {
        return $this->belongsTo(User::class, "emp_id");
    }
}
