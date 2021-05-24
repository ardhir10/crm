<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ProjectItem extends Model
{
    public $timestamps = true;

    public function user()
    {
        return $this->belongsTo('App\User', 'created_by');
    }

    protected $fillable = [
        'item_id', 'description', 'type', 'mfg', 'qty', 'unit', 'price', 'disc', 'total_cost', 'created_by', 'project_id',
    ];
}
