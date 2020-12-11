<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Position extends Model
{
    protected $table = "position";
    
    protected $guarded = [];

    public function user()
    {
        return $this->hasMany(User::class);
    }
    public function employee()
    {
        return $this->hasOne(Karyawan::class);
    }
}
