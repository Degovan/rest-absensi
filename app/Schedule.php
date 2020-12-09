<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Schedule extends Model
{
    protected $table = "schedules";
    
    protected $guarded = [];

    public function user()
    {
        return $this->hasMany(User::class);
    }
}
