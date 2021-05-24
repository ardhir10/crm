<?php

namespace App\Http\Controllers;

use App\Project as Projects;
use App\ProjectItem as ProjectItems;
use App\PurchaseOrder as PurchaseOrders;
use App\PurchaseOrderItem as PurchaseOrderItems;
use App\PurchaseRequisition as PurchaseRequisitions;
use App\PurchaseRequisitionItem as PurchaseRequisitionItems;
use App\Vendor as Vendors;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Session;

class PurchaseOrderController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */

    private $view = 'purchase_order';
    private $base_route = 'purchase-orders';
    public function index(Request $request)
    {
        $data['page_title'] = 'Purchase Orders';
        $data['base_route'] = $this->base_route;

        // Check ID Not Has PR Approve
        $dataProjects = Projects::when($request->project, function ($query) use ($request) {
            $query->where('name', 'LIKE', "%{$request->project}%");
        })->orderBy('id', 'desc')->get();

        $projectIdHasPrApprove = [];
        foreach ($dataProjects as $dp) {
            if ($dp->pr()->get()->where('status', 1)->count() == 0) {
                array_push($projectIdHasPrApprove, $dp->id);
            }
        }

        // $data['projects'] = Projects::orderBy('id', 'desc')->paginate(10);
        $data['projects'] = Projects::when($request->project, function ($query) use ($request) {
            $query->where('name', 'LIKE', "%{$request->project}%");
        })->whereNotIn('id', $projectIdHasPrApprove)->orderBy('id', 'desc')->paginate(8);

        if ($request->project) {
            $data['projects']->appends($request->only('project'));
        }

        return view($this->view . '.index', $data);
    }

    function list($id) {
        $data['page_title'] = ' Purchase Orders';
        $data['base_route'] = $this->base_route;

        $data['purchase_requisition'] = PurchaseRequisitions::findOrFail($id);

        $data['purchase_orders'] = PurchaseOrders::where('purchase_requisition_id', $id)->orderBy('id', 'desc')->get();
        $data['pr_items'] = PurchaseRequisitionItems::where('purchase_requisition_id', $id)->orderBy('id', 'desc')->get();
        // $data['purchase_requisitions'] = PurchaseRequisitions::where('project_id', $id)->orderBy('id', 'desc')->get();

        // dd($data['purchase_requisitions']);

        return view($this->view . '.list', $data);
    }

    public function items($id)
    {
        $data['page_title'] = 'Purchase Orders';
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

        return view($this->view . '.items', $data);
    }

    public function addItem(Request $request, $po_id)
    {

        $data['item_id'] = $request->input('item_id');
        $purchase_requisition_item = PurchaseRequisitionItems::findOrFail($data['item_id']);

        $data['item_id'] = $purchase_requisition_item->item_id;
        $data['description'] = $purchase_requisition_item->description;
        $data['type'] = $purchase_requisition_item->type;
        $data['mfg'] = $purchase_requisition_item->mfg;

        $data['qty'] = $purchase_requisition_item->qty;
        $data['qty_po'] = $request->input('qty_po');

        $data['unit'] = $purchase_requisition_item->unit;

        $data['price'] = $purchase_requisition_item->price;
        $data['price_po'] = $request->input('price_po');

        $data['price'] = $purchase_requisition_item->price;
        $data['disc'] = $purchase_requisition_item->disc;
        $data['disc_po'] = $request->input('disc_po');

        $data['net_price'] = $request->input('net_price');
        $data['total_cost'] = $purchase_requisition_item->total_cost;

        $data['vendor'] = $request->input('vendor');

        $data['purchase_order_id'] = $po_id;
        $data['created_by'] = Auth::user()->id;
        $data['status'] = 0;

        PurchaseOrderItems::create($data);
        return redirect(url($this->base_route . '/' . $po_id . '/items'))->with(['create' => 'Item added successfully!  ']);
    }

    public function updateItem(Request $request)
    {
        $id = $request->input('edit_id');

        $data['qty_po'] = $request->input('qty_po');

        $data['price_po'] = $request->input('price_po');

        $data['disc_po'] = $request->input('disc_po');

        $data['net_price'] = $request->input('net_price');

        $data['vendor'] = $request->input('vendor');

        $data['created_by'] = Auth::user()->id;
        // dd($data);

        PurchaseOrderItems::where('id', $id)->update($data);
        return redirect::back()->with(['update' => 'Item updated successfully!  ']);
    }

    public function destroyItem($id)
    {
        DB::transaction(function () use ($id) {
            PurchaseOrderItems::where('id', $id)->delete();
        });

        Session::flash('delete', 'Data deleted successfully!');
        return response()->json(['status' => '200']);
    }

    public function create_po($project_id, $pr_id)
    {
        $data['page_title'] = 'Purchase Orders';
        $data['base_route'] = $this->base_route;

        $data['purchase_requisition'] = PurchaseRequisitions::findOrFail($pr_id);

        $data['project'] = Projects::findOrFail($project_id);
        $data['projects'] = Projects::orderBy('id', 'desc')->paginate(10);
        $data['vendors'] = Vendors::orderBy('id', 'desc')->get();
        $data['project_items'] = ProjectItems::where('project_id', $project_id)->orderBy('id', 'desc')->get();
        $data['po_number'] = $this->getNextOrderNumber($data['purchase_requisition']->pr_number);

        return view($this->view . '.create', $data);
    }

    public function getNextOrderNumber($pr_number)
    {
        // Get the last created order
        $lastPO = PurchaseOrders::where('po_number', 'LIKE', '%' . $pr_number . '%')->orderBy('id', 'desc')->withTrashed()->first();

        if (!$lastPO)
        // We get here if there is no order at all
        // If there is no number set it to 0, which will be 1 at the end.
        {
            $number = 0;
        } else {
            $lastPONumber = $lastPO->po_number;
            $number = substr($lastPONumber, 3);
        }

        // If we have ORD000001 in the database then we only want the number
        // So the substr returns this 000001

        // Add the string in front and higher up the number.
        // the %05d part makes sure that there are always 6 numbers in the string.
        // so it adds the missing zero's when needed.

        return 'PO ' . sprintf('%03d', intval($number) + 1) . ' - ' . $pr_number;

        // return $lastPONumber;

    }

    public function updatePO(Request $request)
    {

        $id = $request->input('id');
        $request->validate([
            'po_number' => ['required', 'string', 'min:5', 'max:255', 'unique:purchase_orders,po_number,' . $id],
            'vendor' => 'required',
        ]);

        $data['po_number'] = $request->input('po_number');
        $data['vendor'] = $request->input('vendor');

        PurchaseOrders::where('id', $id)->update($data);

        $data_pr = PurchaseOrders::find($id);
        // dd($data_pr);

        return redirect(url($this->base_route . '/' . $data_pr->purchase_requisition_id . '/list'))->with(['update' => 'Item update successfully!  ']);
    }

    public function updateStatus(Request $request)
    {

        $id = $request->input('id');

        $data['status'] = $request->input('status');
        DB::transaction(function () use ($id, $data, $request) {
            PurchaseOrderItems::where('purchase_order_id', $id)->update($data);

            $data['delivered_at'] = $request->input('delivered_at');
            if ($data['status'] == 0) {
                $data['delivered_at'] = null;
            }
            PurchaseOrders::where('id', $id)->update($data);
        });

        $data_pr = PurchaseOrders::find($id);
        // dd($data_pr);

        return redirect(url($this->base_route . '/' . $data_pr->purchase_requisition_id . '/list'))->with(['update' => 'Status updated successfully!  ']);
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
        $request->validate([
            'po_number' => ['required', 'string', 'min:5', 'max:255', 'unique:purchase_orders,po_number'],
            'purchase_requisition_id' => 'required',
            'vendor' => 'required',
        ]);

        $data['po_number'] = $request->input('po_number');
        $data['vendor'] = $request->input('vendor');
        $data['status'] = 0;
        $data['purchase_requisition_id'] = $request->input('purchase_requisition_id');
        $data['created_by'] = Auth::user()->id;

        $data_project = PurchaseRequisitions::find($request->input('purchase_requisition_id'));
        // dd($data_project);
        $dataPO = PurchaseOrders::create($data);

        return redirect(url($this->base_route . '/' . $dataPO->id . '/items'))->with(['create' => 'Data saved successfully!  ']);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $data['page_title'] = 'List Purchase Requisitions';
        $data['base_route'] = $this->base_route;

        $data['project'] = Projects::findOrFail($id);
        $data['purchase_requisitions'] = PurchaseRequisitions::where('project_id', $id)->where('status', 1)->orderBy('id', 'desc')->get();

        // dd($data['purchase_requisitions']);

        return view($this->view . '.show', $data);
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
        DB::transaction(function () use ($id) {
            PurchaseOrders::find($id)->delete();
        });

        Session::flash('delete', 'Data deleted successfully!');
        return response()->json(['status' => '200']);
    }
}
