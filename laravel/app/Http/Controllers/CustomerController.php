<?php

namespace App\Http\Controllers;

use App\Customer as Customers;
use File;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;

class CustomerController extends Controller
{

    public function __construct()
    {
        $this->middleware('auth');
        $this->middleware('privilege:CustomersView', ['only' => 'index']);
        $this->middleware('privilege:CustomersCreate', ['only' => 'create']);
        $this->middleware('privilege:CustomersEdit', ['only' => 'edit']);
        $this->middleware('privilege:CustomersDelete', ['only' => 'destroy']);
    }

    private $view = 'customer';
    private $base_route = 'customers';

    public function index()
    {
        $data['page_title'] = 'Customers Management ';
        $data['base_route'] = $this->base_route;
        $data['customers'] = Customers::orderBy('id', 'desc')->get();

        return view($this->view . '.index', $data);
    }

    public function create()
    {
        $data['page_title'] = 'Create Customer';
        $data['base_route'] = $this->base_route;

        return view($this->view . '.create', $data);
    }

    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|min:2',
            'logo' => 'image|mimes:jpeg,png,jpg,gif,svg|max:2048',
        ]);

        if ($request->hasFile('logo')) {
            $image = $request->file('logo');
            $name = time() . '.' . $image->getClientOriginalExtension();
            $destinationPath = public_path('backend/images/customers');
            $image->move($destinationPath, $name);
            $data['logo'] = $name;
        }

        $data['name'] = $request->input('name');

        Customers::create($data);

        return redirect($this->base_route)->with(['create' => 'Data saved successfully!']);
    }

    public function show($id)
    {

    }

    public function edit($id)
    {
        $data['page_title'] = 'Edit Customer';
        $data['base_route'] = $this->base_route;
        $data['customer'] = Customers::findOrFail($id);

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

        $data_customer = Customers::findOrFail($id);

        $request->validate([
            'name' => 'required|min:2',

        ]);

        if ($request->hasFile('logo')) {
            $request->validate([
                'logo' => 'image|mimes:jpeg,png,jpg,gif,svg|max:2048',
            ]);

            // Delete Img
            if ($data_customer->logo) {
                $image_path = public_path('backend/images/customers/' . $data_customer->logo); // Value is not URL but directory file path
                if (File::exists($image_path)) {
                    File::delete($image_path);
                }
            }

            $image = $request->file('logo');
            $name = time() . '.' . $image->getClientOriginalExtension();
            $destinationPath = public_path('backend/images/customers');
            $image->move($destinationPath, $name);
            $data['logo'] = $name;
        }

        $data['name'] = $request->input('name');

        Customers::where('id', $id)->update($data);

        return redirect($this->base_route)->with(['update' => 'Data update successfully!']);
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
            $data_customer = Customers::findOrFail($id);
            // Delete Img
            if ($data_customer->logo) {
                $image_path = public_path('backend/images/customers/' . $data_customer->logo); // Value is not URL but directory file path
                if (File::exists($image_path)) {
                    File::delete($image_path);
                }
            }
            Customers::where('id', $id)->delete();
        });

        // redirect('departements')->with(['delete' => 'Data deleted successfully!']);
        Session::flash('delete', 'Data deleted successfully!');
        return response()->json(['status' => '200']);
    }
}
