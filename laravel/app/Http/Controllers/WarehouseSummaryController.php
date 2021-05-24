<?php

namespace App\Http\Controllers;

use App\Departement as Departements;
use App\PurchaseOrder as PurchaseOrders;
use App\PurchaseOrderItem as PurchaseOrderItems;
use App\PurchaseRequisition as PurchaseRequisitions;
use App\PurchaseRequisitionItem as PurchaseRequisitionItems;
use App\User as Users;
use App\WarehouseInItem as WarehouseInItems;
use App\WarehouseItem as WarehouseItems;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class WarehouseSummaryController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */

    private $view = 'warehouse';
    private $base_route = 'warehouse';

    public function index()
    {
        $data['users'] = Users::paginate(5);
        $data['page_title'] = 'Warehouse Summary';
        $data['departements'] = Departements::all();
        $data['users'] = Users::all();
        $data['pr'] = PurchaseRequisitions::all();
        $data['po'] = PurchaseOrders::all();
        $data['trending_po'] = PurchaseOrders::all();
        $data['base_route'] = $this->base_route;

        $data['trending_po_0'] = PurchaseOrderItems::select(DB::raw('sum(price) as price_sum,created_at'))
        // ->where('tstamp', 'LIKE', "%$date%")
            ->where('status', '0')
            ->orderBy('id', 'asc')
            ->groupBy(DB::raw('MONTH(created_at),DAY(created_at)'))
            ->get();

        $data['trending_po_1'] = PurchaseOrderItems::select(DB::raw('sum(price) as price_sum,created_at'))
        // ->where('tstamp', 'LIKE', "%$date%")
            ->where('status', '1')
            ->orderBy('id', 'asc')
            ->groupBy(DB::raw('MONTH(created_at),DAY(created_at)'))
            ->get();

        $data['trending_po_2'] = PurchaseOrderItems::select(DB::raw('sum(price) as price_sum,created_at'))
        // ->where('tstamp', 'LIKE', "%$date%")
            ->where('status', '2')
            ->orderBy('id', 'asc')
            ->groupBy(DB::raw('MONTH(created_at),DAY(created_at)'))
            ->get();

        $data['price_po_awaiting'] = PurchaseOrderItems::where('status', 0)->sum('price_po');
        $data['price_po_delivered'] = PurchaseOrderItems::where('status', 1)->sum('price_po');
        $data['price_po_warehouse'] = PurchaseOrderItems::where('status', 2)->sum('price_po');
        $data['last_pr'] = PurchaseRequisitions::orderBy('id', 'desc')->take(10)->get();
        $data['last_po'] = PurchaseOrders::where('status', '!=', 0)->orderBy('id', 'desc')->take(10)->get();

        $data['item_in'] = WarehouseItems::where('status', 1)->sum('qty');
        $data['item_out'] = WarehouseItems::where('status', 0)->sum('qty');

        return view('warehouse.summary.index', $data);
    }

    public function po($id)
    {
        $data['page_title'] = 'Warehouse';
        $data['base_route'] = $this->base_route;

        $data['purchase_order'] = PurchaseOrders::findOrFail($id);
        $data['purchase_requisition'] = PurchaseRequisitions::findOrFail($data['purchase_order']->purchase_requisition_id);
        // $data['pr_items'] = PurchaseRequisitionItems::where('purchase_requisition_id', $data['purchase_requisition']->id)->get();
        $data['po_items'] = PurchaseOrderItems::where('purchase_order_id', $data['purchase_order']->id)->orderBy('id', 'desc')->get();
        $id_pr_items = [];
        foreach ($data['po_items'] as $pr) {
            array_push($id_pr_items, $pr->item_id);
        }
        // $data['project_items'] = ProjectItems::whereNotIn('item_id', $id_pr_items)->where('project_id', $data['purchase_requisition']->project_id)->orderBy('id', 'desc')->get();
        $data['pr_items'] = PurchaseRequisitionItems::whereNotIn('id', $id_pr_items)->where('purchase_requisition_id', $data['purchase_order']->purchase_requisition_id)->orderBy('id', 'desc')->get();
        // dd($data['pr_items']);
        // $data['purchase_requisitions'] = PurchaseRequisitions::where('project_id', $id)->orderBy('id', 'desc')->get();

        // dd($data['purchase_requisitions']);

        return view($this->view . '.purchase_order.index', $data);
    }
    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
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

    public function verified(Request $request, $id)
    {
        $password = $request->input('password');

        if (Hash::check($password, Auth::user()->password)) {

            $data['status'] = 2;
            DB::transaction(function () use ($id, $data, $request) {
                PurchaseOrderItems::where('purchase_order_id', $id)->update($data);

                $data['warehouse_at'] = date('Y-m-d H:i:s');
                PurchaseOrders::where('id', $id)->update($data);

                $itemInPO = PurchaseOrderItems::where('purchase_order_id', $id)->get();

                $itemInInsert = [];
                foreach ($itemInPO as $iip) {
                    $ststamp = date('Y-m-d H:i:s');
                    $pushData = array(
                        'item_id' => $iip->item_id,
                        'description' => $iip->description,
                        'type' => $iip->type,
                        'mfg' => $iip->mfg,
                        'qty' => $iip->qty_po,
                        'unit' => $iip->unit,
                        'price' => $iip->price_po,
                        'disc' => $iip->disc_po,
                        'net_price' => $iip->net_price,
                        'total_cost' => $iip->total_cost,
                        'vendor' => $iip->vendor,
                        'purchase_order_id' => $iip->purchase_order_id,
                        'status' => 1,
                        'created_by' => Auth::user()->id,
                        'created_at' => $ststamp,
                    );

                    array_push($itemInInsert, $pushData);

                }
                WarehouseItems::insert($itemInInsert);
                WarehouseInItems::insert($itemInInsert);

            });

            $data_pr = PurchaseOrders::find($id);

            return redirect()->back()->with(['update' => 'Purchase Order status updated successfully  !  ']);
        } else {
            return redirect()->back()->with(['delete' => 'Password Incorrect !  ']);
        }

    }

    public function trending()
    {

        $date = date('Y-m');
        // $date = '2019-10';
        $dataItemIn = WarehouseInItems::select(DB::raw('sum(qty) as qty_item,created_at'))
            ->orderBy('id', 'asc')
            ->where('created_at', 'LIKE', "%$date%")
        // ->where('status', '1')
            ->groupBy(DB::raw('purchase_order_id'))
            ->get();

        $tstamp = [];
        $totalItem = [];

        foreach ($dataItemIn as $dt) {
            array_push($tstamp, date('Y-m-d H:i:s', strtotime($dt->created_at)));
            array_push($totalItem, $dt->qty_item);
        }

        $result['tstamp'] = $tstamp;
        $result['total_item'] = $totalItem;

        // dd($result);
        return response()->json(['data' => $result]);

    }
}
