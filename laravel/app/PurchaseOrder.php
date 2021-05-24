<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class PurchaseOrder extends Model
{
    use SoftDeletes;
    public $timestamps = true;
    protected $dates = ['deleted_at'];

    public function user()
    {
        return $this->belongsTo('App\User', 'created_by');
    }

    public function pr()
    {
        return $this->belongsTo('App\PurchaseRequisition', 'purchase_requisition_id');
    }

    public function items()
    {
        return $this->hasMany('App\PurchaseOrderItem');
    }
    protected $fillable = [
        'po_number', 'vendor', 'status', 'purchase_requisition_id', 'created_by', 'delevered_at', 'warehouse_at',
    ];
}
