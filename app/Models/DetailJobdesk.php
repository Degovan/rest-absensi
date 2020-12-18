<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class DetailJobdesk extends Model
{
    protected $table = 'detail_jobdesk';

    public function jobdesk()
    {
        return $this->hasOne(Jobdesk::class, 'jobdesk_id', 'jobdesk_id');
    }
}
