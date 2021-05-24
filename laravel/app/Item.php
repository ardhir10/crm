<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Item extends Model
{

    public $timestamps = true;

    protected $fillable = [
        'description', 'type', 'mfg', 'qty', 'unit', 'price', 'disc', 'total_cost',
    ];

    protected $guard = [];
}
