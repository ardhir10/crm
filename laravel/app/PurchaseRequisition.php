<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class PurchaseRequisition extends Model
{

    // use SoftDeletes;
    public $timestamps = true;
    // protected $dates = ['deleted_at'];

    public function user()
    {
        return $this->belongsTo('App\User', 'created_by');
    }

    public function project()
    {
        return $this->belongsTo('App\Project', 'project_id');
    }

    public function items()
    {
        return $this->hasMany('App\PurchaseRequisitionItem');
    }

    public function po()
    {
        return $this->hasMany('App\PurchaseOrder');
    }

    protected $fillable = [
        'pr_number', 'status', 'project_id', 'created_by',
    ];
}
