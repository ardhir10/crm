<?php

namespace App\Http\Controllers;

use App\PurchaseOrder as PurchaseOrders;
use App\User as Users;
use App\Wip as Wips;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class WipController extends Controller
{

    private $view = 'wip';
    private $base_route = 'warehouse';
    public function index()
    {
        $data['users'] = Users::paginate(5);
        $data['page_title'] = 'Work In Process Items';
        $data['base_route'] = $this->base_route;

        $data['last_po'] = PurchaseOrders::where('status', '!=', 0)->orderBy('id', 'desc')->take(10)->get();

        return view('warehouse.' . $this->view . '.index', $data);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $data['users'] = Users::paginate(5);
        $data['page_title'] = 'Create Work In Process Items';
        $data['base_route'] = $this->base_route;

        $data['base_route'] = $this->base_route;

        $data['last_po'] = PurchaseOrders::where('status', '!=', 0)->orderBy('id', 'desc')->take(10)->get();

        $data['wip_number'] = $this->getNextNumber();
        // dd($this->getNextNumber());

        return view('warehouse.' . $this->view . '.create', $data);
    }

    public function getNextNumber()
    {
        // Get the last created order
        $lastPO = Wips::orderBy('id', 'desc')->first();

        if (!$lastPO)
        // We get here if there is no order at all
        // If there is no number set it to 0, which will be 1 at the end.
        {
            $number = 0;
        } else {
            $lastPONumber = $lastPO->wip_number;
            $number = substr($lastPONumber, 3);
        }

        // If we have ORD000001 in the database then we only want the number
        // So the substr returns this 000001

        // Add the string in front and higher up the number.
        // the %05d part makes sure that there are always 6 numbers in the string.
        // so it adds the missing zero's when needed.

        return 'WIP ' . sprintf('%03d', intval($number) + 1);

        // return $lastPONumber;

    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $request->validate([
            'wip_number' => 'required|min:3',
            'request_by' => 'required|min:2',
        ]);

        $data['tstamp'] = date('Y-m-d H:i:s');
        $data['wip_number'] = $request->input('wip_number');
        $data['request_by'] = $request->input('request_by');
        $data['description'] = $request->input('description');
        $data['approved_by'] = Auth::user()->id;
        $dataWip = Wips::create($data);

    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
