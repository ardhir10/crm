<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Vendor extends Model
{
    public $timestamps = true;

    protected $fillable = [
        'name',
    ];
}
