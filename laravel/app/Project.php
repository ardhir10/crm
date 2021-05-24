<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Project extends Model
{
    public $timestamps = true;

    public function customer()
    {
        return $this->belongsTo('App\Customer');
    }

    public function items()
    {
        return $this->hasMany('App\ProjectItem');
    }

    public function pr()
    {
        return $this->hasMany('App\PurchaseRequisition');
    }

    protected $fillable = [
        'project_number', 'name', 'description', 'customer_id',
    ];
}
