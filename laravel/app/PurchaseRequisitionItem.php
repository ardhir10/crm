<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class PurchaseRequisitionItem extends Model
{

    public $timestamps = true;

    public function user()
    {
        return $this->belongsTo('App\User', 'created_by');
    }

    public function pr()
    {
        return $this->belongsTo('App\PurchaseRequisition', 'project_id');
    }

    protected $fillable = [
        'item_id', 'description', 'type', 'mfg', 'qty', 'unit', 'price', 'disc', 'total_cost', 'created_by', 'purchase_requisition_id',
    ];
}
