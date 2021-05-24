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

    .ui-datepicker {
        z-index: 1151 !important;;
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
<div class="br-mainpanel">
    <div class="br-pageheader">
        <div>
            <nav class="breadcrumb pd-0 mg-0 tx-12">
                <a class="breadcrumb-item" href="index.html">{{config('app.name')}}</a>
                <span class="breadcrumb-item ">{{$page_title}}</span>
                <span class="breadcrumb-item ">{{$purchase_requisition->project['name']}}</span>
                <span class="breadcrumb-item ">{{$purchase_requisition->pr_number}}</span>
                <span class="breadcrumb-item active">List Purchase Orders</span>

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




            </div>

            <div class="col-lg-9 ">
                <div class="br-section-wrapper  rounded-20" style="padding: 30px 20px">

                    <div style="align" class="row">
                        <div class="col-12 col-lg-6">
                            <span class="tx-bold tx-18"><i class="icon ion ion-clipboard tx-22"></i> List Purchase
                                Orders
                                ({{$purchase_requisition->pr_number}})</span>


                        </div>
                        <div class="col-12 col-lg-6">

                            <a href="{{url($base_route.'/'.$purchase_requisition->project['id']) }}" class="">
                                <button class="btn btn-sm btn-danger mg-l-10 float-right "><i
                                        class="icon ion ion-ios-arrow-back"></i>
                                    Back</button>
                            </a>
                            <a
                                href="{{url($base_route.'/'.$purchase_requisition->project->id.'/create/'.$purchase_requisition->id) }}">
                                <button class="btn btn-sm btn-info float-right"><i
                                        class="icon ion ion-ios-plus-outline"></i>
                                    Create
                                    PO</button>
                            </a>
                        </div>

                    </div>
                    <hr>
                    @if(session()->has('create'))
                    <div class="alert alert-success ">
                        {{ session()->get('create') }}
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    @endif

                    @if(session()->has('update'))
                    <div class="alert alert-warning ">
                        {{ session()->get('update') }}
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>

                    </div>
                    @endif


                    @if(session()->has('delete'))
                    <div class="alert alert-danger ">
                        {{ session()->get('delete') }}
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>

                    </div>
                    @endif

                    <div class="row">
                        <div class="col-lg-12">
                            <div class="table-wrapper">
                                <table class="table  display responsive" id="datatable1">
                                    <thead>
                                        <th>NO</th>
                                        <th>PO NUMBER</th>
                                        <th>VENDOR</th>
                                        <th>ITEM</th>
                                        <th class="nowrap">Date Created</th>
                                        <th class="">Status</th>
                                        {{-- <th>By</th> --}}
                                        <th width="18%"></th>
                                    </thead>
                                    <tbody>

                                        @php
                                        $no=1;
                                        @endphp
                                        @foreach ($purchase_orders as $po)
                                        <tr>
                                            <td>{{$no++}}</td>
                                            <td>{{$po->po_number}}</td>
                                            <td>{{$po->vendor}}</td>
                                            <td>{{$po->items()->get()->count()}}</td>
                                            <td>{{$po->created_at}}</td>
                                            <td>
                                                @if ($po->status == 0)
                                                <span class="btn btn-danger btn-sm rounded-10"> <i
                                                        class="icon ion ion-card"></i> Awaiting Payment</span>
                                                @endif

                                                @if ($po->status == 1)
                                                <span class="btn btn-success btn-sm rounded-10"><i
                                                        class="fa fa-truck"></i> Delivered</span>
                                                @endif

                                                @if ($po->status == 2)
                                                <span class="btn btn-dark btn-sm rounded-10"> <i
                                                        class="icon ion ion-ios-home-outline"></i> Warehouse</span>
                                                @endif
                                            </td>
                                            {{-- <td>{{$po->user->name}}</td> --}}

                                            <td>
                                               
                                               
                                                <a href="{{url($base_route.'/'.$po->id.'/items')}}"><button
                                                    class="btn btn-sm btn-info" data-toggle="tooltip"
                                                    data-placement="top" title="Items"><i
                                                        class="icon ion ion-cube"></i></button></a>
                                              

                                                @if ($po->items()->get()->count() == 0 || $po->status == 2)
                                                <button class="btn btn-sm btn-teal" disabled data-toggle="tooltip"
                                                    data-placement="top" title="Change Status"><i
                                                        class="icon ion ion-android-clipboard"></i></button>
                                                @else
                                                <button class="btn btn-sm btn-teal"
                                                    onclick="showModalEditStatus({{$po->id}},'{{$po->status}}','{{$po->delivered_at}}')"
                                                    data-toggle="tooltip" data-placement="top" title="Change Status"><i
                                                        class="icon ion ion-android-clipboard"></i></button>
                                                @endif



                                                @if ($po->status == 1 || $po->status == 2)
                                                <button class="btn btn-sm btn-warning" disabled data-toggle="tooltip"
                                                    data-placement="top" title="Edit"><i
                                                        class="icon ion ion-edit"></i></button>
                                                @else
                                                <button class="btn btn-sm btn-warning"
                                                    onclick="showModal({{$po->id}},'{{$po->po_number}}','{{$po->vendor}}')"
                                                    data-toggle="tooltip" data-placement="top" title="Edit"><i
                                                        class="icon ion ion-edit"></i></button>
                                                @endif



                                                <button class="btn btn-sm btn-danger" onclick="deleteData({{$po->id}})"
                                                    data-toggle="tooltip" data-placement="top" title="Delete"><i
                                                        class="icon ion ion-trash-a"></i></button>
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




    <!-- EDIT ITEM MODAL -->
    <div id="editmodal" class="modal fade">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content bd-0 tx-14">
                <div class="modal-header pd-y-20 pd-x-25">
                    <h6 class="tx-14 mg-b-0 tx-uppercase tx-inverse tx-bold">Edit PO</h6>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>

                <form action="{{url($base_route.'/update-po')}}" method="post">
                    @csrf
                    <div class="modal-body pd-25">
                        @if ($errors->any())
                        <div class="alert alert-danger">
                            <ul>
                                @foreach ($errors->all() as $error)
                                <li>{{ $error }}</li>
                                @endforeach
                            </ul>
                        </div>
                        @endif
                        <input type="hidden" min="0" max=" " id="edit-id" name="id" class="form-control " required>
                        <div class="form-group">
                            <label for="">PO Number : </label>
                            <br>
                            <input type="text" name="po_number" class="form-control text-info"
                                id="edit-po-number"></input>

                        </div>
                        <div class="form-group">
                            <label for="">Vendor :</label>
                            <input type="text" id="edit-vendor" value="" name="vendor" class="form-control " required>
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


    <!-- EDIT STATUS MODAL -->
    <div id="editStatusmodal" class="modal fade">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content bd-0 tx-14">
                <div class="modal-header pd-y-20 pd-x-25">
                    <h6 class="tx-14 mg-b-0 tx-uppercase tx-inverse tx-bold">Edit Status PO</h6>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>

                <form action="{{url($base_route.'/update-status')}}" method="post">
                    @csrf
                    <div class="modal-body pd-25">
                        @if ($errors->any())
                        <div class="alert alert-danger">
                            <ul>
                                @foreach ($errors->all() as $error)
                                <li>{{ $error }}</li>
                                @endforeach
                            </ul>
                        </div>
                        @endif
                        <input type="hidden" min="0" max=" " id="edit-status-id" name="id" class="form-control "
                            value="" required>

                        <div class="form-group">
                            <label for="">Status :</label>
                            <select name="status" id="status-po" class="form-control">
                                <option value="0">Awaiting Payment</option>
                                <option value="1">Delivered</option>
                                {{-- <option value="2">Warehouse</option> --}}
                            </select>
                        </div>

                        <div class="form-group">
                            <label for="">Date :</label>
                        <input type="text" autocomplete="off" class="form-control fc-datepicker" name="delivered_at" id="delivered-at" value="{{ date('Y-m-d') }}" placeholder="YYYY-MM-DD">

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
</div><!-- br-mainpanel -->


@endsection

@push('scripts')
<script>
    $(function () {
        'use strict'
        // Datepicker
        $('.fc-datepicker').datepicker({
            showOtherMonths: true,
            selectOtherMonths: true,
            dateFormat: 'yy-mm-dd'
        });
    });

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


    function showModal(id, po_number, vendor) {
        $('#edit-id').val(id);
        $('#edit-po-number').val(po_number);
        $('#edit-vendor').val(vendor);
        // $('#edit-qty').val(qty);
        $('#editmodal').modal('show');
    }

    function showModalEditStatus(id, status, delivered_at) {
        $('#edit-status-id').val(id);
        $('#status-po').val(status);
        $('#delivered-at').val(delivered_at);
        console.log(delivered_at);
        // $('#edit-qty').val(qty);
        $('#editStatusmodal').modal('show');
    }

</script>
@endpush
