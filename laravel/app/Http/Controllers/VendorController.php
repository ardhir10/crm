<?php

namespace App\Http\Controllers;

use App\Vendor as Vendors;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Session;

class VendorController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */

    private $view = 'vendor';
    private $base_route = 'vendors';

    public function index()
    {
        $data['page_title'] = 'Vendors Management ';
        $data['base_route'] = $this->base_route;
        $data['vendors'] = Vendors::orderBy('id', 'desc')->get();
        return view($this->view . '.index', $data);
    }

    public function create()
    {
        $data['page_title'] = 'Create Vendor';
        $data['base_route'] = $this->base_route;
        $data['vendors'] = Vendors::orderBy('id', 'desc')->get();
        return view($this->view . '.create', $data);
    }

    public function store(Request $request)
    {
        $request->validate([
            'name' => ['required', 'string', 'min:2', 'max:255', 'unique:vendors'],
        ]);
        $data['name'] = $request->input('name');
        Vendors::insert($data);
        return redirect($this->base_route)->with(['create' => 'Data created successfully!']);

    }

    public function show($id)
    {

    }

    public function edit($id)
    {
        $data['page_title'] = 'Edit Vendor';
        $data['base_route'] = $this->base_route;
        $data['vendor'] = Vendors::findOrFail($id);
        return view($this->view . '.edit', $data);
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'name' => ['required', 'string', 'min:2', 'max:255', 'unique:vendors,name,' . $id],
        ]);
        $data['name'] = $request->input('name');
        Vendors::where('id', $id)->update($data);
        return redirect($this->base_route)->with(['update' => 'Data updated successfully!']);
    }

    public function destroy($id)
    {

        Vendors::where('id', $id)->delete();
        Session::flash('delete', 'Data deleted successfully!');
        return response()->json(['status' => '200']);
    }
}
