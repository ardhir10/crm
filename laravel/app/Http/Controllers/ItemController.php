<?php

namespace App\Http\Controllers;

use App\Imports\ImportItem;
use App\Imports\TestImport;
use App\Item as Items;
use Auth;
use DataTables;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;
use Maatwebsite\Excel\Facades\Excel;

class ItemController extends Controller
{

    public function __construct()
    {
        $this->middleware('auth');
        $this->middleware('privilege:ItemsView', ['only' => 'index']);
        $this->middleware('privilege:ItemsCreate', ['only' => 'create']);
        $this->middleware('privilege:ItemsEdit', ['only' => 'edit']);
        // $this->middleware('privilege:DepartementsEdit', ['only' => ]);
        $this->middleware('privilege:ItemsDelete', ['only' => 'destroy']);
    }

    private $view = 'item';
    private $base_route = 'items';

    public function index()
    {

        $data['page_title'] = 'Items Management ';
        $data['base_route'] = $this->base_route;
        $data['items'] = Items::orderBy('id', 'desc')->get();

        return view($this->view . '.index', $data);
    }

    public function json()
    {
        return Datatables::of(Items::orderBy('id', 'desc')->get())->addIndexColumn()->make(true);
    }

    public function create()
    {
        $data['page_title'] = 'Create Item';
        $data['base_route'] = $this->base_route;

        return view($this->view . '.create', $data);
    }

    public function store(Request $request)
    {

        $request->validate([
            'description' => 'required|min:2',
            'qty' => 'required',
            'unit' => 'required',
            'price' => 'required',
            // 'total_cost' => 'required',
        ]);

        $data['description'] = $request->input('description');
        $data['type'] = $request->input('type');
        $data['mfg'] = $request->input('mfg');
        $data['qty'] = $request->input('qty');
        $data['unit'] = $request->input('unit');
        $data['price'] = $request->input('price');
        $data['disc'] = $request->input('disc');
        $data['total_cost'] = $request->input('total_cost');
        $data['user_id'] = Auth::user()->id;

        Items::create($data);

        return redirect($this->base_route)->with(['create' => 'Data saved successfully!']);
    }

    public function storeItem(Request $request)
    {
        // dd('store');
        $request->validate([
            'description' => 'required|min:2|unique:items,description',
            'type' => 'unique:items,type',
            'qty' => 'required',
            'unit' => 'required',
            'price' => 'required',
            // 'total_cost' => 'required',
        ]);

        $data['description'] = $request->input('description');
        $data['type'] = $request->input('type');
        $data['mfg'] = $request->input('mfg');
        $data['qty'] = $request->input('qty');
        $data['unit'] = $request->input('unit');
        $data['price'] = $request->input('price');
        $data['disc'] = $request->input('disc');
        $data['total_cost'] = $request->input('total_cost');
        $data['user_id'] = Auth::user()->id;

        Items::create($data);

        return redirect($this->base_route)->with(['create' => 'Data saved successfully!']);
    }

    public function show($id)
    {

    }

    public function edit($id)
    {
        $data['page_title'] = 'Edit Item';
        $data['base_route'] = $this->base_route;
        $data['item'] = Items::findOrFail($id);
        // dd($departement);
        return view($this->view . '.edit', $data);
    }

    // public function update(Request $request, $id)
    // {
    //     $request->validate([
    //         'description' => 'required|min:2',
    //         'qty' => 'required',
    //         'unit' => 'required',
    //         'price' => 'required',
    //         // 'total_cost' => 'required',
    //     ]);

    //     $data['description'] = $request->input('description');
    //     $data['type'] = $request->input('type');
    //     $data['mfg'] = $request->input('mfg');
    //     $data['qty'] = $request->input('qty');
    //     $data['unit'] = $request->input('unit');
    //     $data['price'] = $request->input('price');
    //     $data['disc'] = $request->input('disc');
    //     $data['total_cost'] = $request->input('total_cost');
    //     $data['user_id'] = Auth::user()->id;

    //     // Items::update($data);
    //     Items::where('id', $id)->update($data);

    //     return redirect($this->base_route)->with(['update' => 'Data updated successfully!']);
    // }

    public function updateItem(Request $request, $id)
    {
        $request->validate([
            'description' => 'required|min:2',
            'qty' => 'required',
            'unit' => 'required',
            'price' => 'required',
            // 'total_cost' => 'required',
        ]);

        $data['description'] = $request->input('description');
        $data['type'] = $request->input('type');
        $data['mfg'] = $request->input('mfg');
        $data['qty'] = $request->input('qty');
        $data['unit'] = $request->input('unit');
        $data['price'] = $request->input('price');
        $data['disc'] = $request->input('disc');
        $data['total_cost'] = $request->input('total_cost');
        $data['user_id'] = Auth::user()->id;

        // Items::update($data);
        Items::where('id', $id)->update($data);

        return redirect($this->base_route)->with(['update' => 'Data updated successfully!']);
    }

    public function destroy($id)
    {
        Items::where('id', $id)->delete();

        // redirect('departements')->with(['delete' => 'Data deleted successfully!']);
        Session::flash('delete', 'Data deleted successfully!');
        return response()->json(['status' => '200']);
    }

    // public function getDownload()
    // {
    //     //PDF file is stored under project/public/download/info.pdf
    //     $file = public_path() . "/files/SampleItem.xlsx";

    //     $headers = array(
    //         'Content-Type: application/pdf',
    //     );

    //     return Response::download($file, 'filename.pdf', $headers);
    // }

    public function download($file_name)
    {
        $file_path = public_path('files/' . $file_name);
        return response()->download($file_path);
    }

    public function import_excel(Request $request)
    {
        // validasi
        $this->validate($request, [
            'file' => 'required|mimes:csv,xls,xlsx',
        ]);

        // menangkap file excel
        $file = $request->file('file');

        // membuat nama file unik
        $nama_file = rand() . $file->getClientOriginalName();

        // upload ke folder file_siswa di dalam folder public
        $file->move('laravel/public/files/import', $nama_file);

        // import data
        Excel::import(new ImportItem, public_path('/files/import/' . $nama_file));
        // $results = Excel::load(public_path('/files/' . $nama_file))->get();
        // $result = Excel::load(public_path('/files/' . $nama_file))->all();
        // var_dump($result);
        // alihkan halaman kembali
        return redirect($this->base_route)->with(['create' => 'Data import successfully!']);
    }

    public function import_test()
    {

        // import data
        Excel::import(new TestImport, public_path('/files/import/items.xlsx'));
        // $results = Excel::load(public_path('/files/' . $nama_file))->get();
        // $result = Excel::load(public_path('/files/' . $nama_file))->all();
        // var_dump($result);
        // alihkan halaman kembali
        // return redirect($this->base_route)->with(['create' => 'Data saved successfully!']);
    }

    public function destroySelectedItems(Request $request)
    {
        // $request->input('ids');
        $ids = $request->input('id_many');
        Items::destroy($ids);
        Session::flash('delete', '<b>' . count($ids) . '</b> Selected data deleted successfully!');

        return response()->json(['status' => '200']);

        // redirect or whatever...
    }
}
