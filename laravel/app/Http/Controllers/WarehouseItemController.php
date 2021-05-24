<?php

namespace App\Http\Controllers;

use App\User as Users;
use App\WarehouseInItem as WarehouseInItems;
use App\WarehouseItem as WarehouseItems;
use App\WarehouseOutItem as WarehouseOutItems;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class WarehouseItemController extends Controller
{
    private $view = 'warehouse';
    private $base_route = 'warehouse';
    public function index()
    {
        $data['users'] = Users::paginate(5);
        $data['page_title'] = 'Items ';
        $data['items'] = WarehouseItems::orderBy('id', 'desc')
            ->select(DB::raw('*,sum(qty) as qty_sum'))
            ->groupBy('item_id')
            ->get();
        return view($this->view . '.item.index', $data);
    }

    public function itemIn()
    {
        $data['users'] = Users::paginate(5);
        $data['page_title'] = 'Items In';
        $data['items'] = WarehouseInItems::orderBy('id', 'desc')
            ->get();
        return view($this->view . '.item.item_in', $data);
    }

    public function itemOut()
    {
        $data['users'] = Users::paginate(5);
        $data['page_title'] = 'Items Out';
        $data['items'] = WarehouseOutItems::orderBy('id', 'desc')
            ->select(DB::raw('*,sum(qty) as qty_sum'))
            ->groupBy('item_id')
            ->get();
        return view($this->view . '.item.item_out', $data);
    }

    public function create()
    {
    }

    public function store(Request $request)
    {
    }

    public function show($id)
    {
    }

    public function edit($id)
    {
        //
    }

    public function update(Request $request, $id)
    {
    }

    public function destroy($id)
    {
    }
}
