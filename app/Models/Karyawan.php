<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Foundation\Auth\User as Authenticatable;

class Karyawan extends Authenticatable
{
    protected $table = 'karyawan';

    protected $fillable = ['karyawan_id', 'kd_karyawan', 'name', 'ktp', 'alamat', 'phone', 'pendidikan', 'jk_kelamin', 'jabatan_id', 'perusahaan_id', 'tgl_masuk', 'status_id', 'phone_saudara', 'photo', 'gaji_pokok', 'jam_kerja', 'rate_gaji', 'pasword', 'bank_id', 'no_rek', 'created', 'updated', 'api_token'];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'api_token'
    ];

    public function job_desk()
    {
        return $this->hasMany(JobDesk::class, 'karyawan_id', 'karyawan_id');
    }
}
