<?php

namespace App\Http\Controllers;

use App\Item as Items;
use App\PurchaseOrder as PurchaseOrders;
use App\PurchaseOrderItem as PurchaseOrderItems;
use App\PurchaseRequisition as PurchaseRequisitions;
use App\User as Users;
use Illuminate\Support\Facades\DB;

class DashboardController extends Controller
{
    //

    public function __construct()
    {
        $this->middleware('auth');

        // $this->middleware('privilege:Dashboard');

    }

    public function index()
    {
        $data['users'] = Users::paginate(5);
        $data['page_title'] = 'Dashboard';
        $data['items'] = Items::all();
        $data['users'] = Users::all();
        $data['pr'] = PurchaseRequisitions::all();
        $data['po'] = PurchaseOrders::all();
        $data['trending_po'] = PurchaseOrders::all();

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

        $data['last_po'] = PurchaseOrders::orderBy('id', 'desc')->take(10)->get();
        // dd($data['last_pr']);
        return view('dashboard.index', $data);
    }
}
