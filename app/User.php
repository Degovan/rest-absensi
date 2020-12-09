<?php

namespace App;

use Illuminate\Notifications\Notifiable;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;

class User extends Authenticatable
{
    protected $table = "employees";
    // use Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    // protected $fillable = [
    //     'email', 'password', "api_token",
    // ];

    public $timestamps = false;

    protected $guarded = [];


    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token', 'api_token'
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    // protected $casts = [
    //     'email_verified_at' => 'datetime',
    // ];


    /**
     * RELASIONAL
     */

    public function school()
    {
        return $this->belongsTo(School::class);
    }

    public function position()
    {
        return $this->belongsTo(Position::class);
    }

    public function schedule()
    {
        return $this->belongsTo(Schedule::class);
    }

    public function jadwal()
    {
        return $this->belongsTo(Jadwal::class);
    }

    public function cabang()
    {
        return $this->belongsTo(Cabang::class);
    }

    public function status()
    {
        return $this->belongsTo(Status::class);
    }

    public function attendance()
    {
        return $this->hasMany(Attendance::class, "employee_id");
    }

    public function ts()
    {
        return $this->hasMany(Ts::class, "emp_id");
    }

}
