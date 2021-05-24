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
<div class="br-mainpanel">
    <div class="br-pageheader">
        <div>
            <nav class="breadcrumb pd-0 mg-0 tx-12">
                <a class="breadcrumb-item" href="index.html">{{config('app.name')}}</a>
                <span class="breadcrumb-item ">{{$page_title}}</span>
                <span class="breadcrumb-item ">{{$purchase_requisition->project['name']}}</span>
                <span class="breadcrumb-item active">{{$purchase_requisition->pr_number}}</span>

            </nav>

        </div>
    </div><!-- br-pageheader -->


    <div class="br-pagebody">



        <div class="row">
            <div class="col-sm-6  col-lg-3">
                <a href="">
                    <div class="card shadow-base  bd-0  card__one mg-b-20 rounded-20" style="">
                        <div class="card-header  bg-mantle d-flex justify-content-between align-items-center"
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

                        </div><!-- card-body -->
                    </div><!-- card -->
                </a>




            </div>

            <div class="col-lg-9 ">
                <div class="br-section-wrapper  rounded-20" style="padding: 30px 20px">

                    <div style="align" class="row">
                        <div class="col-12 col-lg-6">
                            <span class="tx-bold tx-18"><i class="icon ion ion-clipboard tx-22"></i> Items
                                {{$purchase_requisition->pr_number}}</span>

                        </div>
                        <div class="col-12 col-lg-6">

                            <a href="{{url($base_route.'/'.$purchase_requisition->project['id']) }}" class="">
                                <button class="btn btn-sm btn-danger mg-l-10 float-right "><i
                                        class="icon ion ion-ios-arrow-back"></i>
                                    Back</button>
                            </a>
                            {{-- <a href="{{url($base_route.'/'.$purchase_requisition->id.'/create') }}"> --}}
                            <button class="btn btn-sm btn-info float-right" data-toggle="modal"
                                data-target="#modaldemo1"><i class="icon ion ion-ios-plus-outline"></i>
                                Add
                                Item</button>
                            {{-- </a> --}}
                        </div>

                    </div>
                    <hr>
                    @if(session()->has('create'))
                    <div class="alert alert-success wd-100p">
                        {{ session()->get('create') }}
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    @endif

                    @if(session()->has('update'))
                    <div class="alert alert-warning wd-100p">
                        {{ session()->get('update') }}
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>

                    </div>
                    @endif


                    @if(session()->has('delete'))
                    <div class="alert alert-danger wd-100p">
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
                                        <th width="40%">Description</th>
                                        <th>Qty</th>
                                        <th class="nowrap">Date Created</th>
                                        {{-- <th>Status</th> --}}
                                        <th>By</th>
                                        <th width="10%"></th>
                                    </thead>
                                    <tbody>

                                        @php
                                        $no=1;
                                        @endphp
                                        @foreach ($pr_items as $pr_item)
                                        <tr>
                                            <td>{{$no++}}</td>
                                            <td>{{$pr_item->description}}</td>
                                            <td>{{$pr_item->qty}}</td>
                                            <td>{{$pr_item->created_at}}</td>
                                            <td>{{$pr_item->user['name']}}</td>
                                            <td>
                                                <button class="btn btn-sm btn-warning"
                                                    onclick="showModal({{$pr_item->id}},'{{$pr_item->description}}',{{$pr_item->qty}})"
                                                    data-toggle="tooltip" data-placement="top" title="Edit"><i
                                                        class="icon ion ion-edit"></i></button>
                                                <button class="btn btn-sm btn-danger"
                                                    onclick="deleteItem({{$pr_item->id}})" data-toggle="tooltip"
                                                    data-placement="top" title="Delete"><i
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
                <form action="{{url($base_route.'/'.$purchase_requisition->id.'/add-item')}}" method="post">
                    @csrf
                    <div class="modal-body pd-25">
                        <div class="form-group">
                            <label for="">Select Item :</label>
                            <br>
                            <select class="form-control select2-show-search" style="width:100%" name="item_id" required>
                                <option label="Choose one"></option>
                                @foreach ($project_items as $project_item)
                                <option name="item_id" value="{{$project_item->id}}">{{$project_item->description}}
                                </option>
                                @endforeach
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="">Qty :</label>
                            <input type="number" min="0" max=" " name="qty" class="form-control " required>
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
                    <div class="modal-body pd-25">
                        <input type="hidden" min="0" max=" " id="edit-id" name="id" class="form-control " required>
                        <div class="form-group">
                            <label for="">Item :</label>
                            <br>
                            <span class="text-info" id="edit-desc"></span>

                        </div>
                        <div class="form-group">
                            <label for="">Qty :</label>
                            <input type="number" min="0" max=" " id="edit-qty" name="qty" class="form-control "
                                required>
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


    function showModal(id, description, qty) {
        $('#edit-id').val(id);
        $('#edit-desc').text(description);
        $('#edit-qty').val(qty);
        $('#editmodal').modal('show');
    }

</script>
@endpush
