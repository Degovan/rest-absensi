<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Jadwal extends Model
{
    protected $table = "jadwals";
    
    protected $guarded = [];

    public function user()
    {
        return $this->hasMany(User::class);
    }
}
