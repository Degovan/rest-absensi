<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Karyawan extends Model
{
    protected $table = 'employees';

    protected $gurded = [];

    public $timestamps = false;

    // posisi
    public function position()
    {
        return $this->belongsTo(Position::class);
    }

    // schedule
    public function schedule()
    {
        return $this->belongsTo(Schedule::class);
    }

    // cabang
    public function branch()
    {
        return $this->belongsTo(Cabang::class);
    }

    // Jadwal
    public function declination()
    {
        return $this->belongsTo(Jadwal::class);
    }
}
