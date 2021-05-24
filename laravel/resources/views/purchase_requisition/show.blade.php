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
                <span class="breadcrumb-item active">{{$project->name}}</span>

            </nav>

        </div>
    </div><!-- br-pageheader -->


    <div class="br-pagebody">



        <div class="row">
            <div class="col-sm-6  col-lg-3">
                <a href="">
                    <div class="card shadow-base  bd-0  card__one mg-b-20 rounded-20">
                        <div class="card-header bg-mantle d-flex justify-content-between align-items-center"
                            style=" border-radius: 122px;border-bottom-left-radius: 0px;">
                            <h6 class="card-title tx-uppercase  text-white tx-12 mg-b-0">{{$project->name}}</h6>
                            <span
                                class="tx-12 tx-uppercase text-white ">{{date('d M Y',strtotime($project->created_at))}}</span>
                        </div><!-- card-header -->
                        <div class="card-body">
                            <p class="tx-sm tx-inverse tx-medium mg-b-0">{{$project->customer['name'] }}</p>
                            <p class="tx-12">{{$project->description}}</p>
                            <div class="row align-items-center">
                                <div class="col-3 tx-12">Item :</div><!-- col-3 -->
                                <div class="col-9">
                                    {{$project->items()->get()->count() }}
                                </div><!-- col-9 -->
                            </div><!-- row -->
                            {{-- <div class="row align-items-center mg-t-5">
                                    <div class="col-3 tx-12">CPU2</div><!-- col-3 -->
                                    <div class="col-9">
                                        <div class="progress rounded-0 mg-b-0">
                                            <div class="progress-bar bg-pink wd-100p90p lh-3" role="progressbar" aria-valuenow="90"
                                                aria-valuemin="0" aria-valuemax="100">90%</div>
                                        </div><!-- progress -->
                                    </div><!-- col-9 -->
                                </div><!-- row --> --}}
                            {{-- <p class="tx-11 mg-b-0 mg-t-15">Notice: Lorem ipsum dolor sit amet.</p> --}}
                        </div><!-- card-body -->
                    </div><!-- card -->
                </a>
            </div>

            <div class="col-lg-9 ">
                <div class="br-section-wrapper  rounded-20" style="padding: 30px 20px">
                    <div style="align" class="row">
                        <div class="col-12 col-lg-6">
                            <span class="tx-bold tx-18"><i class="icon ion ion-clipboard tx-22"></i> {{$page_title}} (
                                {{$project->name}})</span>
                        </div>

                        <div class="col-12 col-lg-6">
                            <a href="{{url($base_route) }}" class="">
                                <button class="btn btn-sm btn-danger mg-l-10 float-right "><i
                                        class="icon ion ion-ios-arrow-back"></i>
                                    Back</button>
                            </a>
                            <a href="{{url($base_route.'/'.$project->id.'/create') }}">
                                <button class="btn btn-sm btn-info float-right"><i
                                        class="icon ion ion-ios-plus-outline"></i>
                                    Create PR</button>
                            </a>
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
                                <table class="table nowrap display responsive" id="datatable1">
                                    <thead>
                                        <th>NO</th>
                                        <th>PR Number</th>
                                        <th>Item</th>
                                        <th>Status</th>
                                        <th>Date Created</th>
                                        {{-- <th>Status</th> --}}
                                        <th>By</th>
                                        <th width="10%"></th>
                                    </thead>

                                    <tbody>
                                        @php
                                        $no=1;
                                        @endphp
                                        @foreach ($purchase_requisitions as $purchase_requisition)
                                        <tr>
                                            <td>{{$no++}}</td>
                                            <td>{{$purchase_requisition->pr_number}}</td>
                                            <td>{{$purchase_requisition->items()->count()}}</td>
                                            <td>
                                                @if ($purchase_requisition->status == 0)
                                                <span class="badge badge-danger">Not Approved</span>
                                                @endif

                                                @if ($purchase_requisition->status == 1)
                                                <span class="badge badge-success">Approved</span>
                                                @endif
                                            </td>
                                            <td>{{$purchase_requisition->created_at}}</td>
                                            {{-- <td>{{$purchase_requisition->status}}</td> --}}
                                            <td>{{$purchase_requisition->user['name']}}</td>
                                            <td>

                                                @if ($purchase_requisition->status == 0)
                                                    @if ($purchase_requisition->items()->count() == 0)
                                                    <button class="btn btn-sm btn-success" disabled data-toggle="tooltip"
                                                        data-placement="top" title="Approve"><i
                                                            class="icon fa fa-thumbs-up"></i></button>
                                                    @else
                                                    <a onclick=" "
                                                        href="{{url($base_route.'/'.$purchase_requisition->id.'/approve')}}"><button
                                                            class="btn btn-sm btn-success" data-toggle="tooltip"
                                                            data-placement="top" title="Approve"><i
                                                                class="icon fa fa-thumbs-up"></i></button></a>
                                                    @endif
                                                @endif


                                                @if ($purchase_requisition->status == 1)
                                                    @if ($purchase_requisition->po()->where('status','!=',0)->count() || $purchase_requisition->po()->count() )
                                                   <button
                                                        class="btn btn-sm btn-pink" data-toggle="tooltip"
                                                        data-placement="top" title="Cancel" disabled><i
                                                            class="icon fa fa-thumbs-down"></i></button>
                                                    @else
                                                    <a onclick=" "
                                                    href="{{url($base_route.'/'.$purchase_requisition->id.'/cancel')}}"><button
                                                        class="btn btn-sm btn-pink" data-toggle="tooltip"
                                                        data-placement="top" title="Cancel"><i
                                                            class="icon fa fa-thumbs-down"></i></button></a>
                                                    @endif
                                               
                                                @endif

                                                <a href="{{url($base_route.'/'.$purchase_requisition->id.'/items')}}"><button
                                                        class="btn btn-sm btn-info" data-toggle="tooltip"
                                                        data-placement="top" title="Items" ><i
                                                            class="icon ion ion-cube"></i></button></a>

                                                
                                                @if ($purchase_requisition->po()->where('status','!=',0)->count())
                                               <button
                                                    class="btn btn-sm btn-warning" data-toggle="tooltip"
                                                    data-placement="top" title="Edit" disabled><i
                                                        class="icon ion ion-edit"></i></button>
                                                @else
                                                <a href="{{url($base_route.'/'.$purchase_requisition->id.'/edit')}}"><button
                                                    class="btn btn-sm btn-warning" data-toggle="tooltip"
                                                    data-placement="top" title="Edit" ><i
                                                        class="icon ion ion-edit"></i></button></a>
                                                @endif
                                                
                                                <button class="btn btn-sm btn-danger"
                                                    onclick="deleteData({{$purchase_requisition->id}})"
                                                    data-toggle="tooltip" data-placement="top" title="Delete"
                                                    ><i class="icon ion ion-trash-a"></i></button>
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

    @include('layouts.partials.footer')
</div><!-- br-mainpanel -->\


@endsection

@push('scripts')
<script>
    // var route_url = '{{$base_route}}';
    var route_url = '{{ url($base_route)}}';

</script>
@endpush
