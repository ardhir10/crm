<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Test extends Model
{

    public $timestamps = false;

    protected $fillable = [
        'value', 'value2', 'value3', 'value4', 'value5', 'value6',
    ];

}
