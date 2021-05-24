<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class PurchaseOrderItem extends Model
{
    public function user()
    {
        return $this->belongsTo('App\User', 'created_by');
    }

    protected $fillable = [
        'item_id', 'description', 'type', 'mfg', 'qty', 'qty_po', 'unit', 'price', 'price_po', 'disc', 'disc_po', 'net_price', 'total_cost', 'vendor', 'purchase_order_id', 'created_by', 'status',
    ];
}
