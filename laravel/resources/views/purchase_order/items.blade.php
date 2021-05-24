@extends('layouts.main')

@section('page_title',$page_title)

@section('css')
<style>
    a {
        color: inherit;
    }

    .card__one {
        transition: transform .5s;
    }

    .card__one::after {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        transition: opacity 2s cubic-bezier(.165, .84, .44, 1);
        box-shadow: 0 8px 17px 0 rgba(0, 0, 0, .2), 0 6px 20px 0 rgba(0, 0, 0, .15);
        content: '';
        opacity: 0;
        z-index: -1;
    }

    .card__one:hover,
    .card__one:focus {
        transform: scale3d(1.036, 1.036, 1);
        -webkit-box-shadow: -1px -1px 16px -4px rgba(0, 0, 0, 0.53);
        -moz-box-shadow: -1px -1px 16px -4px rgba(0, 0, 0, 0.53);
        box-shadow: -1px -1px 16px -4px rgba(0, 0, 0, 0.53);


    }

    .select2-container--open {
        z-index: 9999999
    }



    a:hover {
        color: inherit;
        text-decoration: none;
        cursor: pointer;
    }

</style>

@endsection

@section('content')
<div class="br-mainpanel" id="app">
    <div class="br-pageheader">
        <div>
            <nav class="breadcrumb pd-0 mg-0 tx-12">
                <a class="breadcrumb-item" href="index.html">{{config('app.name')}}</a>
                <span class="breadcrumb-item ">{{$page_title}}</span>
                <span class="breadcrumb-item ">{{$purchase_requisition->project['name']}}</span>
                <span class="breadcrumb-item ">{{$purchase_requisition->pr_number}}</span>
                <span class="breadcrumb-item ">{{$purchase_order->po_number}}</span>
                <span class="breadcrumb-item active">Items</span>

            </nav>

        </div>
    </div><!-- br-pageheader -->


    <div class="br-pagebody">



        <div class="row">
            <div class="col-sm-6  col-lg-3">
                <a href="">
                    <div class="card shadow-base  bd-0  card__one mg-b-20 rounded-20" style="">
                        <div class="card-header  bg-transfile d-flex justify-content-between align-items-center"
                            style=" border-radius: 122px;border-bottom-left-radius: 0px;">
                            <h6 class="card-title text-white tx-uppercase tx-12 mg-b-0">
                                {{$purchase_requisition->project->name}}</h6>
                            <span
                                class="tx-12 text-white tx-uppercase">{{date('M Y',strtotime($purchase_requisition->project->created_at))}}</span>
                        </div><!-- card-header -->
                        <div class="card-body">
                            <p class="tx-sm tx-inverse tx-medium mg-b-0">
                                {{$purchase_requisition->project->customer['name'] }}</p>
                            <p class="tx-12">{{$purchase_requisition->project->description}}</p>
                            <div class="row align-items-center">
                                <div class="col-3 tx-12">Item :</div><!-- col-3 -->
                                <div class="col-9">
                                    {{$purchase_requisition->project->items()->get()->count() }}
                                </div><!-- col-9 -->
                            </div><!-- row -->

                        </div><!-- card-body -->
                    </div><!-- card -->
                </a>



                <a href="">
                    <div class="card shadow-base  bd-0  card__one mg-b-20 rounded-20">

                        <div class="card-body">
                            <h5 class="card-title tx-uppercase tx-14 mg-b-0">{{$purchase_requisition->pr_number}}</h5>
                            <span
                                class="tx-12 tx-uppercase">{{date('d M Y',strtotime($purchase_requisition->created_at))}}</span>
                            <hr>

                            <div class="row align-items-center">
                                <div class="col-3 tx-12">Item :</div><!-- col-3 -->
                                <div class="col-9">
                                    {{$purchase_requisition->items()->get()->count() }}
                                </div><!-- col-9 -->
                            </div><!-- row -->
                        </div><!-- card-body -->
                    </div><!-- card -->
                </a>

                <a href="">
                    <div class="card shadow-base  bd-0  card__one mg-b-20 rounded-20">

                        <div class="card-body">
                            <h5 class="card-title tx-uppercase tx-14 mg-b-0">{{$purchase_order->po_number}}</h5>
                            <span
                                class="tx-12 tx-uppercase">{{date('d M Y',strtotime($purchase_order->created_at))}}</span>
                            <hr>

                            <div class="row align-items-center">
                                <div class="col-4 tx-12">Item :</div><!-- col-3 -->
                                <div class="col-8">
                                    {{$purchase_order->items()->get()->count() }}
                                </div><!-- col-9 -->
                            </div><!-- row -->
                            <div class="row align-items-center">
                                <div class="col-4 tx-12">STATUS :</div><!-- col-3 -->
                                <div class="col-8">
                                    @if ($purchase_order->status == 0)
                                    <span class="pd-5 badge badge-danger rounded-5"> <i class="icon ion ion-card"></i>
                                        Awaiting Payment</span>
                                    @endif

                                    @if ($purchase_order->status == 1)
                                    <span class="pd-5 badge badge-success rounded-5"><i class="fa fa-truck"></i>
                                        Delivered</span>
                                    @endif

                                    @if ($purchase_order->status == 2)

                                    <span class="pd-5  badge badge-dark rounded-5"> <i
                                            class="icon ion ion-ios-home-outline"></i> Warehouse</span>
                                    @endif
                                </div><!-- col-9 -->
                            </div><!-- row -->
                            <div class="row align-items-center">
                                <div class="col-4 tx-12">VENDOR :</div><!-- col-3 -->
                                <div class="col-8">
                                    <span class="pd-5 badge badge-danger">{{$purchase_order->vendor }}</span>
                                </div><!-- col-9 -->
                            </div><!-- row -->
                        </div><!-- card-body -->
                    </div><!-- card -->
                </a>




            </div>

            <div class="col-lg-9 ">
                <div class="br-section-wrapper  rounded-20" style="padding: 30px 20px">

                    <div style="align" class="row">
                        <div class="col-12 col-lg-6">
                            <span class="tx-bold tx-18"><i class="icon ion ion-clipboard tx-22"></i> Items in
                                {{$purchase_order->po_number}} </span>


                        </div>
                        <div class="col-12 col-lg-6">

                            <a href="{{url($base_route.'/'.$purchase_requisition->id.'/list') }}" class="">
                                <button class="btn btn-sm btn-danger mg-l-10 float-right "><i
                                        class="icon ion ion-ios-arrow-back"></i>
                                    Back</button>
                            </a>
                            {{-- <a href="{{url($base_route.'/'.$purchase_requisition->id.'/create') }}"> --}}

                            @if($purchase_order->status == 1 || $purchase_order->status == 2))
                            <button class="btn btn-sm btn-info float-right" disabled><i
                                    class="icon ion ion-ios-plus-outline"></i>
                                Add
                                Item</button>
                            @else
                            <button class="btn btn-sm btn-info float-right" data-toggle="modal"
                                data-target="#modaldemo1"><i class="icon ion ion-ios-plus-outline"></i>
                                Add
                                Item</button>
                            @endif

                            {{-- </a> --}}
                        </div>

                    </div>
                    <hr>
                    @if(session()->has('create'))
                    <div class="alert alert-success wd-50p">
                        {{ session()->get('create') }}
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    @endif

                    @if(session()->has('update'))
                    <div class="alert alert-warning wd-50p">
                        {{ session()->get('update') }}
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>

                    </div>
                    @endif


                    @if(session()->has('delete'))
                    <div class="alert alert-danger wd-50p">
                        {{ session()->get('delete') }}
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>

                    </div>
                    @endif

                    <div class="row">
                        <div class="col-lg-12">
                            <div class="table-wrapper">
                                <table class="table  display  responsive" id="datatable1">
                                    <thead>
                                        <th>NO</th>
                                        <th width="30%">Description</th>
                                        <th>Qty</th>
                                        <th>Price</th>
                                        <th>Disc</th>
                                        <th>Net Price</th>
                                        <th class="nowrap"> Created</th>
                                        {{-- <th>Status</th> --}}
                                        {{-- <th>By</th> --}}
                                        <th width="10%"></th>
                                    </thead>
                                    <tbody>

                                        @php
                                        $no=1;
                                        @endphp
                                        @foreach ($po_items as $po_item)
                                        <tr>
                                            <td>{{$no++}}</td>
                                            <td>{{$po_item->description}}</td>
                                            <td>{{$po_item->qty_po}}</td>
                                            <td>{{number_format($po_item->price_po,0,',','.')}}</td>
                                            <td>{{$po_item->disc_po}}</td>
                                            <td>{{number_format($po_item->net_price,0,',','.')}}</td>
                                            <td>{{$po_item->created_at}}</td>
                                            {{-- <td>{{$po_item->user['name']}}</td> --}}
                                            <td>
                                                


                                                @if($purchase_order->status == 1 || $purchase_order->status == 2)
                                                <button class="btn btn-sm btn-warning"
                                                    
                                                     disabled data-placement="top" title="Edit"><i
                                                        class="icon ion ion-edit"></i></button>
                                                <button class="btn btn-sm btn-danger" disabled
                                                    
                                                    data-placement="top" title="Delete"><i
                                                        class="icon ion ion-trash-a"></i></button>
                                                @else
                                                <button class="btn btn-sm btn-warning"
                                                    onclick="showModal({{$po_item->id}},'{{$po_item->description}}',{{$po_item->qty_po}},{{$po_item->price_po}},{{$po_item->disc_po}},{{$po_item->net_price}},'{{$po_item->vendor}}')"
                                                    data-toggle="tooltip" data-placement="top" title="Edit"><i
                                                        class="icon ion ion-edit"></i></button>
                                                <button class="btn btn-sm btn-danger"
                                                    onclick="deleteItem({{$po_item->id}})" data-toggle="tooltip"
                                                    data-placement="top" title="Delete"><i
                                                        class="icon ion ion-trash-a"></i></button>
                                                @endif
                                            </td>
                                        </tr>
                                        @endforeach
                                    </tbody>



                                </table>

                            </div>

                        </div>
                    </div>

                    {{-- {{ $users->link    s() }} --}}
                </div>

            </div>





        </div>


    </div><!-- br-pagebody -->


    <!-- ADD ITEM MODAL -->
    <div id="modaldemo1" class="modal fade">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content bd-0 tx-14">
                <div class="modal-header pd-y-20 pd-x-25">
                    <h6 class="tx-14 mg-b-0 tx-uppercase tx-inverse tx-bold">Add Item</h6>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form action="{{url($base_route.'/'.$purchase_order->id.'/add-item')}}" method="post">
                    @csrf


                    <div class="modal-body pd-25">
                        <div class="form-group">
                            <label for="">Select Item :</label>
                            <br>
                            <select class="form-control select2-show-search" style="width:100%" name="item_id"
                                id="item-list" required>
                                <option label="Choose one"></option>
                                @foreach ($pr_items as $pr_item)
                                <option name="item_id" value="{{$pr_item->id}}" data-price="{{$pr_item->price}}"
                                    data-qty="{{$pr_item->qty}}">
                                    {{$pr_item->description}}
                                </option>
                                @endforeach
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="">Qty :</label>
                            <input type="number" v-model="qty" min="0" max=" " name="qty_po" class="form-control "
                                required>
                            <small>Qty request : <span id="qty-req"></span></small>
                        </div>

                        <div class="form-group">
                            <label for="">Price :</label>
                            <input type="number" v-model="price" min="0" name="price_po" class="form-control"
                                id="price_item" value="" required>
                        </div>

                        <div class="form-group">
                            <label for="">Disc :</label>
                            <input type="number" min="0" v-model="disc" max=" " name="disc_po" class="form-control "
                                required>
                        </div>

                        <div class="form-group">
                            <label for="">Net Price :</label>
                            <input type="number" min="0" v-model="netPrice" max=" " name="net_price"
                                class="form-control " required>
                        </div>

                        <div class="form-group">
                            <label for="">Sub Total Price :</label>
                            <input type="number" min="0" v-model="SubTotalPrice" readonly max=" " name="total_price"
                                class="form-control " required>
                        </div>

                        <div class="form-group">
                            <label for="">Vendor :</label>
                            <input type="text" readonly name="vendor" class="form-control"
                                value="{{$purchase_order->vendor}}">
                        </div>
                    </div>
                    <div class=" modal-footer">
                        <button class="btn btn-primary tx-11 tx-uppercase pd-y-12 pd-x-25 tx-mont tx-medium"
                            type="submit">Add</button>
                        <button type="button"
                            class="btn btn-secondary tx-11 tx-uppercase pd-y-12 pd-x-25 tx-mont tx-medium"
                            data-dismiss="modal">Close</button>
                    </div>
                </form>
            </div>
        </div><!-- modal-dialog -->
    </div><!-- modal -->

    <!-- EDIT ITEM MODAL -->
    <div id="editmodal" class="modal fade">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content bd-0 tx-14">
                <div class="modal-header pd-y-20 pd-x-25">
                    <h6 class="tx-14 mg-b-0 tx-uppercase tx-inverse tx-bold">Edit Item</h6>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form action="{{url($base_route.'/update-item')}}" method="post">
                    @csrf
                    <input type="hidden" id="edit_id" name="edit_id" value="">
                    <div class="modal-body pd-25">
                        <div class="form-group">
                            <label for="">Description :</label>
                            <br>
                            <span class="text-info" id="edit_desc"></span>

                        </div>
                        <div class="form-group">
                            <label for="">Qty :</label>
                            <input type="number" v-model="Editqty" min="0" max=" " name="qty_po" id="edit_qty"
                                class="form-control " required>
                        </div>

                        <div class="form-group">
                            <label for="">Price : </label>
                            <input type="number" v-model="Editprice" min="0" name="price_po" class="form-control"
                                id="edit_price" value="" required>
                        </div>

                        <div class="form-group">
                            <label for="">Disc :</label>
                            <input type="number" v-model="Editdisc" min="0" max=" " name="disc_po" class="form-control"
                                id="edit_disc" required>
                        </div>

                        <div class="form-group">
                            <label for="">Net Price :</label>
                            <input type="number" v-model="EditnetPrice" min="0" max=" " name="net_price"
                                class="form-control" id="edit_net_price" required>
                        </div>

                        <div class="form-group">
                            <label for="">Sub Total Price :</label>
                            <input type="number" v-model="EditSubTotalPrice" min="0" max=" " name=""
                                class="form-control" id="edit_net_price" required>
                        </div>

                        <div class="form-group">
                            <label for="">Vendor :</label>
                            <input type="text" readonly name="vendor" id="edit_vendor" class="form-control"
                                value="{{$purchase_order->vendor}}">
                        </div>
                    </div>
                    <div class=" modal-footer">
                        <button class="btn btn-warning tx-11 tx-uppercase pd-y-12 pd-x-25 tx-mont tx-medium"
                            type="submit">Update</button>
                        <button type="button"
                            class="btn btn-secondary tx-11 tx-uppercase pd-y-12 pd-x-25 tx-mont tx-medium"
                            data-dismiss="modal">Close</button>
                    </div>
                </form>
            </div>
        </div><!-- modal-dialog -->
    </div><!-- modal -->

    @include('layouts.partials.footer')
</div><!-- br-mainpanel -->\


@endsection

@push('scripts')
<script>
    $('.select3').select2();
    var route_url = '{{ url($base_route)}}';

    function deleteItem(id) {
        $.confirm({

            theme: 'material',
            title: 'Confirm!',
            content: 'Are you sure you want to delete data ?',
            buttons: {
                confirm: function () {
                    $.ajax({
                        type: 'DELETE',
                        url: route_url + '/' + id + '/item',
                        dataType: 'json',
                        headers: {
                            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                        },
                        data: {
                            "_token": "{{ csrf_token() }}"
                        },
                        success: function (data) {
                            location.reload();
                        },
                        error: function (data) {
                            $.alert('Failed!');
                            console.log(data);

                        }
                    });
                },
                cancel: function () {
                    $.alert('Canceled!');
                },
                // somethingElse: {
                //     text: 'Something else',
                //     btnClass: 'btn-blue',
                //     keys: ['enter', 'shift'],
                //     action: function () {
                //         $.alert('Something else?');
                //     }
                // }
            }
        });
    }
    var vm = new Vue({
        el: '#app',
        data: {
            price: '',
            disc: '',
            qty: 0,
            Editprice: '',
            Editdisc: '',
            Editqty: '',

        },
        computed: {
            netPrice: function () {
                // `this` points to the vm instance
                let disc = this.price * (this.disc / 100);

                return this.price - disc;
            },
            SubTotalPrice: function () {
                // `this` points to the vm instance

                return this.netPrice * this.qty;
            },


            EditnetPrice: {
                // getter
                get: function () {
                    let disc = this.Editprice * (this.Editdisc / 100);

                    return this.Editprice - disc;
                },
                // setter
                set: function (val) {
                    let splitValNP = val.split(' ')
                    console.log(splitValNP)
                    this.Editprice = splitValNP[0]
                }
            },
            EditSubTotalPrice: {
                // getter
                get: function () {
                    return this.EditnetPrice * this.Editqty;
                },
                // setter
                set: function (newValue) {
                    let splitVal = newValue.split(' ')
                    this.EditnetPrice = splitVal[0]
                    this.Editqty = splitVal[splitVal.length - 2]
                    this.Editdisc = splitVal[splitVal.length - 1]
                }
            }
        }
    })

    function showModal(id, description, qty_po, price_po, disc_po, net_price, vendor) {

        // vm.Editqty = qty_po;
        // vm.Editprice = price_po;
        // vm.Editdisc = disc_po;
        vm.EditnetPrice = price_po + ' ' + disc_po;
        vm.EditSubTotalPrice = price_po + ' ' + qty_po + ' ' + disc_po;

        $('#edit_id').val(id);
        $('#edit_desc').text(description);
        $('#edit_qty').val(qty_po);
        $('#edit_price').val(price_po);
        $('#edit_disc').val(disc_po);
        $('#edit_net_price').val(net_price);
        $('#editmodal').modal('show');
    }

    $('#item-list').on('change', function () {
        var price = $(this).find(':selected').data('price');
        var qty = $(this).find(':selected').data('qty');
        // console.log(price);
        $('#price_item').val(price);
        $('#qty-req').text(qty);
    });

</script>
@endpush
