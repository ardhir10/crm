<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class WarehouseItem extends Model
{
    public function user()
    {
        return $this->belongsTo('App\User', 'created_by');
    }

    protected $fillable = [
        'item_id', 'description', 'type', 'mfg', 'qty', 'unit', 'price', 'disc', 'net_price', 'total_cost', 'vendor', 'purchase_order_id', 'created_by', 'status',
    ];
}
