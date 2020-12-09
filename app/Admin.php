<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Foundation\Auth\User as Authenticatable;

class Admin extends Authenticatable
{
    protected $table = "admin";

    protected $guard = 'admin';
    
    public $timestamps = false;

    protected $guarded = [];

    protected $hidden = [
        'password', 'remember_token', 'api_token'
    ];

}
