<?php

namespace App\Http\Controllers;

use App\Customer as Customers;
use App\Item as Items;
use App\Project as Projects;
use App\ProjectItem as ProjectItems;
use Auth;
use DataTables;
use DB;
use Illuminate\Http\Request;
use Session;

class ProjectController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */

    public function __construct()
    {
        $this->middleware('auth');
        $this->middleware('privilege:ProjectsView', ['only' => 'index']);
        $this->middleware('privilege:ProjectsCreate', ['only' => 'create']);
        $this->middleware('privilege:ProjectsEdit', ['only' => 'edit']);
        $this->middleware('privilege:ProjectsDelete', ['only' => 'destroy']);
    }

    private $view = 'project';
    private $base_route = 'projects';
    public function index()
    {
        $data['page_title'] = 'Projects Management ';
        $data['base_route'] = $this->base_route;
        $data['projects'] = Projects::orderBy('id', 'desc')->get();

        return view($this->view . '.index', $data);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $data['page_title'] = 'Create Project';
        $data['base_route'] = $this->base_route;
        $data['projects'] = Projects::orderBy('id', 'desc')->get();
        $data['customers'] = Customers::orderBy('id', 'desc')->get();
        $data['project_number'] = $this->autoNumber();

        return view($this->view . '.create', $data);
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
            'project_number' => 'required|min:6',
            'name' => 'required|min:2',
            'customer_id' => 'required',
            // 'description' => 'required|min:2',
        ]);

        $data['project_number'] = $request->input('project_number');
        $data['name'] = $request->input('name');
        $data['description'] = $request->input('description');
        $data['customer_id'] = $request->input('customer_id');
        // dd($data);
        $data = Projects::create($data);

        return redirect($this->base_route . '/' . $data->id . '/items')->with(['create' => 'Data saved successfully!']);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $data['base_route'] = $this->base_route;

        $data['items'] = Items::orderBy('id', 'desc')->get();

        return view($this->view . '.show', $data);
    }

    public function json($project_id)
    {
        $project_item = ProjectItems::where('project_id', $project_id)->get();
        $id_project_items = [];
        foreach ($project_item as $project) {
            array_push($id_project_items, $project->item_id);
        }

        // dd($id_project_items);

        return Datatables::of(Items::whereNotIn('id', $id_project_items)->orderBy('id', 'desc')->get())->addIndexColumn()->make(true);
    }

    public function addItem($id, $project_id, $qty)
    {

        $data_item = Items::find($id);
        $cek_data = ProjectItems::where('item_id', $id)->where('project_id', $project_id)->count();

        $data['item_id'] = $data_item->id;
        $data['description'] = $data_item->description;
        $data['type'] = $data_item->type;
        $data['mfg'] = $data_item->mfg;
        $data['qty'] = $qty;
        $data['unit'] = $data_item->unit;
        $data['price'] = $data_item->price;
        $data['disc'] = $data_item->disc;
        $data['total_cost'] = $data_item->total_cost;
        $data['project_id'] = $project_id;
        $data['created_by'] = Auth::user()->id;
        if ($cek_data > 0) {
            $result['duplicate'] = true;
            $result['description'] = $data_item->description;
            return $result;
        } else {
            $result['duplicate'] = false;
            $result['description'] = $data_item->description;
            ProjectItems::create($data);
            return $result;
        }

    }

    public function items($id)
    {
        $data['page_title'] = 'Project Items';
        $data['base_route'] = $this->base_route;
        $data['projects'] = Projects::orderBy('id', 'desc')->get();
        $data['project_items'] = ProjectItems::where('project_id', $id)->orderBy('id', 'desc')->get();

        $data['project'] = Projects::findOrFail($id);
        $data['customers'] = Customers::orderBy('id', 'desc')->get();

        return view($this->view . '.item', $data);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $data['page_title'] = 'Edit Project';
        $data['base_route'] = $this->base_route;
        $data['project'] = Projects::findOrFail($id);
        $data['customers'] = Customers::orderBy('id', 'desc')->get();

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
            // 'project_number' => 'required|min:6',
            'name' => 'required|min:2',
            'customer_id' => 'required',
            // 'description' => 'required|min:2',
        ]);

        // $data['project_number'] = $request->input('project_number');
        $data['name'] = $request->input('name');
        $data['description'] = $request->input('description');
        $data['customer_id'] = $request->input('customer_id');
        // dd($data);
        Projects::where('id', $id)->update($data);

        return redirect($this->base_route)->with(['update' => 'Data updated successfully!']);
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
            Projects::where('id', $id)->delete();
            ProjectItems::where('project_id', $id)->delete();
        });

        Session::flash('delete', 'Data deleted successfully!');
        return response()->json(['status' => '200']);
    }

    public function destroy_item($id)
    {
        ProjectItems::where('id', $id)->delete();
        Session::flash('delete', 'Data deleted successfully!');
        return response()->json(['status' => '200']);
    }

    public function autoNumber()
    {
        $AWAL = 'JRD';
        // karna array dimulai dari 0 maka kita tambah di awal data kosong
        // bisa juga mulai dari "1"=>"I"
        $bulanRomawi = array("", "I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX", "X", "XI", "XII");
        $noUrutAkhir = Projects::max('project_number');
        $no = 1;
        if ($noUrutAkhir) {
            $thn = date('y');
            $bln = date('m');
            $noUrutAkhir = explode(".", $noUrutAkhir);
            $prefix = sprintf("%03d", abs($noUrutAkhir[2] + 1));
            $hasil = $thn . '.' . $bln . '.' . $prefix;
            // echo "Pake Format : " . sprintf("%03", abs($noUrutAkhir + 1)) . '/' . $AWAL . '/' . $bulanRomawi[date('n')] . '/' . date('Y');
        } else {
            $thn = date('y');
            $bln = date('m');
            $hasil = $thn . '.' . $bln . '.' . '001';
        }

        return $hasil;
    }
}
