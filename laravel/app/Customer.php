<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Customer extends Model
{
    public $timestamps = true;

    protected $fillable = [
        'name', 'logo',
    ];
}
