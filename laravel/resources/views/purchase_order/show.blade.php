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
                    <div class="card shadow-base  bd-0  mg-b-20 rounded-20">
                        <div class="card-header bg-transfile d-flex justify-content-between align-items-center"
                            style=" border-radius: 122px;border-bottom-left-radius: 0px;">
                            <h6 class="card-title tx-uppercase  text-white tx-12 mg-b-0">{{$project->name}}</h6>
                            <span
                                class="tx-12 tx-uppercase text-white ">{{date('d M Y',strtotime($project->created_at))}}</span>
                        </div><!-- card-header -->
                        <div class="card-body">
                            <p class="tx-sm tx-inverse tx-medium mg-b-0">{{$project->customer['name'] }}</p>
                            <p class="tx-12">{{$project->description}}</p>
                            
                          
                        </div><!-- card-body -->
                    </div><!-- card -->
                </a>
            </div>

            <div class="col-lg-9 ">
                <div class="br-section-wrapper  rounded-20" style="padding: 30px 20px">
                    
                    <div style="align" class="row">
                        <div class="col-12 col-lg-6">
                            <span class="tx-bold tx-18"><i class="icon ion ion-ios-cart tx-22"></i> {{$page_title}} (
                                {{$project->name}})</span>
                        </div>

                        <div class="col-12 col-lg-6">
                            <a href="{{url($base_route) }}" class="">
                                <button class="btn btn-sm btn-danger mg-l-10 float-right "><i
                                        class="icon ion ion-ios-arrow-back"></i>
                                    Back</button>
                            </a>
                            {{-- <a href="{{url($base_route.'/'.$project->id.'/create') }}">
                                <button class="btn btn-sm btn-info float-right"><i
                                        class="icon ion ion-ios-plus-outline"></i>
                                    Crea
                                    Data</button>
                            </a> --}}
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
                                <table class="table nowrap display responsive" id="datatable1">
                                    <thead>
                                        <th>NO</th>
                                        <th>PR Number</th>
                                        <th>Item</th>
                                        <th>Date Created</th>
                                        {{-- <th>Status</th> --}}
                                        <th>By</th>
                                        <th>PO</th>
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
                                           
                                            <td>{{$purchase_requisition->created_at}}</td>
                                            {{-- <td>{{$purchase_requisition->status}}</td> --}}
                                            <td>{{$purchase_requisition->user['name']}}</td>
                                            <td>
                                                {{$purchase_requisition->po()->count()}}
                                            </td>
                                            <td>

                                                @if ($purchase_requisition->status == 0)
                                                <a onclick=" " href="{{url($base_route.'/'.$purchase_requisition->id.'/approve')}}"><button
                                                    class="btn btn-sm btn-success" data-toggle="tooltip"
                                                    data-placement="top" title="Approve"><i
                                                        class="icon fa fa-thumbs-up"></i></button></a>
                                                @endif

                                           
                                           
                                                <a href="{{url($base_route.'/'.$purchase_requisition->id.'/list')}}"><button
                                                        class="btn btn-sm btn-teal" data-toggle="tooltip"
                                                        data-placement="top" title="List Purchase Order"><i
                                                            class="icon ion ion-ios-cart "></i> PURCHASE ORDERS</button></a>
                                            
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
