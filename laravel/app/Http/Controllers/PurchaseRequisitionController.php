<?php

namespace App\Http\Controllers;

use App\Project as Projects;
use App\ProjectItem as ProjectItems;
use App\PurchaseOrder as PurchaseOrder;
use App\PurchaseRequisition as PurchaseRequisitions;
use App\PurchaseRequisitionItem as PurchaseRequisitionItems;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;

class PurchaseRequisitionController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    private $view = 'purchase_requisition';
    private $base_route = 'purchase-requisitions';
    public function index(Request $request)
    {
        $data['page_title'] = 'Purchase Requisitions';
        $data['base_route'] = $this->base_route;

        $data['projects'] = Projects::when($request->project, function ($query) use ($request) {
            $query->where('name', 'LIKE', "%{$request->project}%");
        })->orderBy('id', 'desc')->paginate(8);

        if ($request->project) {
            $data['projects']->appends($request->only('project'));
        }

        // orderBy('id', 'desc')->paginate(10);
        $data['purchase_requisition'] = PurchaseRequisitions::all();
        $data['purchase_requisition_approved'] = PurchaseRequisitions::where('status', 1)->get();
        $data['purchase_requisition_canceled'] = PurchaseRequisitions::where('status', 0)->get();

        return view($this->view . '.index', $data);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $data['page_title'] = 'Create Purchase Requisitions';
        $data['base_route'] = $this->base_route;

        $data['projects'] = Projects::orderBy('id', 'desc')->paginate(10);

        return view($this->view . '.create', $data);
    }

    public function create_pr($project_id)
    {
        $data['page_title'] = 'Create Purchase Requisitions';
        $data['base_route'] = $this->base_route;

        $data['project'] = Projects::findOrFail($project_id);
        $data['projects'] = Projects::orderBy('id', 'desc')->paginate(10);
        $data['project_items'] = ProjectItems::where('project_id', $project_id)->orderBy('id', 'desc')->get();

        $data['pr_number'] = $this->getNextOrderNumber($data['project']->project_number);
        return view($this->view . '.create', $data);
    }

    public function getNextOrderNumber($project_number)
    {
        // Get the last created order
        $lastPR = PurchaseRequisitions::where('pr_number', 'LIKE', "%{$project_number}%")->orderBy('id', 'desc')->first();
        // $lastPR = PurchaseRequisitions::withTrashed()->where('pr_number', 'LIKE', "%{$project_number}%")->orderBy('id', 'desc')->first();

        if (!$lastPR)
        // We get here if there is no order at all
        // If there is no number set it to 0, which will be 1 at the end.
        {
            $number = 0;
        } else {
            $lastPrNumber = $lastPR->pr_number;
            $separateProjectNumber = explode(' - ', $lastPR->pr_number);
            $number = substr($lastPrNumber, 3);
        }

        // If we have ORD000001 in the database then we only want the number
        // So the substr returns this 000001

        // Add the string in front and higher up the number.
        // the %05d part makes sure that there are always 6 numbers in the string.
        // so it adds the missing zero's when needed.

        return 'PR ' . sprintf('%03d', intval($number) + 1) . ' - ' . $project_number;

        // return $number;

    }

    public function approve($id)
    {
        // APPROVED
        // dd($id);
        $data['status'] = 1;
        $pr = PurchaseRequisitions::findOrFail($id);
        PurchaseRequisitions::where('id', $id)->update($data);
        return redirect(url($this->base_route . '/' . $pr->project_id))->with(['create' => 'Data successfully Approved !  ']);
    }

    public function cancel($id)
    {
        // CANCEL
        // dd($id);
        $data['status'] = 0;
        $pr = PurchaseRequisitions::findOrFail($id);
        PurchaseRequisitions::where('id', $id)->update($data);
        return redirect(url($this->base_route . '/' . $pr->project_id))->with(['delete' => 'Data successfully Canceled !  ']);
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
            'pr_number' => ['required', 'string', 'max:255'],
            'pr_number_check' => ['required', 'string', 'max:255', 'unique:purchase_requisitions,pr_number'],
            'project_number' => 'required',
        ]);

        $data_project = Projects::where('project_number', $request->input('project_number'))->first();

        $data['pr_number'] = $request->input('pr_number');
        $data['status'] = 0;
        $data['project_id'] = $data_project->id;
        $data['created_by'] = Auth::user()->id;

        // dd($data);
        $dataPR = PurchaseRequisitions::create($data);

        return redirect(url($this->base_route . '/' . $dataPR->id . '/items'))->with(['create' => 'Data created successfully!  ']);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $data['page_title'] = 'Purchase Requisitions';
        $data['base_route'] = $this->base_route;

        $data['project'] = Projects::findOrFail($id);
        $data['purchase_requisitions'] = PurchaseRequisitions::where('project_id', $id)->orderBy('id', 'desc')->get();

        // dd($data['purchase_requisitions']);

        return view($this->view . '.show', $data);
    }

    public function items($id)
    {
        $data['page_title'] = 'Purchase Requisitions';
        $data['base_route'] = $this->base_route;

        $data['purchase_requisition'] = PurchaseRequisitions::findOrFail($id);

        $pr_item = PurchaseRequisitionItems::where('purchase_requisition_id', $id)->get();
        $id_pr_items = [];
        foreach ($pr_item as $pr) {
            array_push($id_pr_items, $pr->item_id);
        }
        $data['project_items'] = ProjectItems::whereNotIn('item_id', $id_pr_items)->where('project_id', $data['purchase_requisition']->project_id)->orderBy('id', 'desc')->get();
        $data['pr_items'] = PurchaseRequisitionItems::where('purchase_requisition_id', $id)->orderBy('id', 'desc')->get();
        // $data['purchase_requisitions'] = PurchaseRequisitions::where('project_id', $id)->orderBy('id', 'desc')->get();

        // dd($data['purchase_requisitions']);

        return view($this->view . '.items', $data);
    }

    public function addItem(Request $request, $pr_id)
    {
        // $request->validate([
        //     'item_id' => 'required',
        //     'qty' => 'required',
        // ]);

        $data_item = ProjectItems::find($request->input('item_id'));
        // $cek_data = PurchaseRequisitionItems::where('item_id', $id)->where('project_id', $project_id)->count();

        $data['item_id'] = $data_item->item_id;
        $data['description'] = $data_item->description;
        $data['type'] = $data_item->type;
        $data['mfg'] = $data_item->mfg;
        $data['qty'] = $request->input('qty');
        $data['unit'] = $data_item->unit;
        $data['price'] = $data_item->price;
        $data['disc'] = $data_item->disc;
        $data['total_cost'] = $data_item->total_cost;
        $data['purchase_requisition_id'] = $pr_id;
        $data['created_by'] = Auth::user()->id;

        // dd($data);
        PurchaseRequisitionItems::create($data);

        return redirect(url($this->base_route . '/' . $pr_id . '/items'))->with(['create' => 'Item added successfully!  ']);
    }

    public function updateItem(Request $request)
    {
        // $request->validate([
        //     'item_id' => 'required',
        //     'qty' => 'required',
        // ]);
        $id = $request->input('id');
        $qty = $request->input('qty');
        $dataItem = PurchaseRequisitionItems::findOrFail($id);

        PurchaseRequisitionItems::where('id', $id)->update(['qty' => $qty]);

        return redirect(url($this->base_route . '/' . $dataItem->purchase_requisition_id . '/items'))->with(['update' => 'Item update successfully!  ']);
    }

    public function destroyItem($id)
    {
        DB::transaction(function () use ($id) {
            PurchaseRequisitionItems::where('id', $id)->delete();
        });

        Session::flash('delete', 'Data deleted successfully!');
        return response()->json(['status' => '200']);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $data['page_title'] = 'Edit Purchase Requisitions';
        $data['base_route'] = $this->base_route;

        $data['purchase_requisitions'] = PurchaseRequisitions::findOrFail($id);
        $pr_number = $data['purchase_requisitions']->pr_number;
        $data['pr_number'] = explode("-", $pr_number);

        return view($this->view . '.edit', $data);
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
        $request->validate([
            'pr_number' => ['required', 'string', 'max:255'],
            'pr_number_check' => ['required', 'string', 'max:255', 'unique:purchase_requisitions,pr_number,' . $id],
            'project_number' => 'required',
        ]);
        $data_project = Projects::where('project_number', $request->input('project_number'))->first();

        $data['pr_number'] = $request->input('pr_number') . ' - ' . $request->input('project_number');

        // dd($data);
        PurchaseRequisitions::where('id', $id)->update($data);
        // PurchaseRequisitions::create($data);

        return redirect(url($this->base_route . '/' . $data_project->id))->with(['update' => 'Data updated successfully!  ']);
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
            // PurchaseRequisitionItems::where('purchase_requisition_id', $id)->delete();
            PurchaseRequisitions::where('id', $id)->delete();
            PurchaseOrder::where('purchase_requisition_id', $id)->delete();
        });

        Session::flash('delete', 'Data deleted successfully!');
        return response()->json(['status' => '200']);
    }
}
