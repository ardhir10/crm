<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Wip extends Model
{
    public $timestamps = true;

    protected $fillable = [
        'tstamp', 'wip_number', 'description', 'purchase_order_id', 'request_by', 'approved_by',
    ];
}
