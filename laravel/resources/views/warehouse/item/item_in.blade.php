@extends('layouts.main')

@section('page_title',$page_title)


@section('content')
<div class="br-mainpanel">
    <div class="br-pageheader">
        <nav class="breadcrumb pd-0 mg-0 tx-12">
            <a class="breadcrumb-item" href="index.html">{{config('app.name')}}</a>
            <span class="breadcrumb-item active">{{$page_title}}</span>
        </nav>
    </div><!-- br-pageheader -->
    {{-- <div class="br-pagetitle">
        <i class="icon icon ion-ios-home-outline"></i>
        <div>
            <h4>{{$page_title}}</h4>
</div>
</div><!-- d-flex --> --}}

<div class="br-pagebody">

    

    <div class="row   mg-b-20">


        <div class="col-lg-12">
            <div class="card">
                <div class="card-header">
                    <h6 class="card-title">{{$page_title}}</h6>
                </div><!-- card-header -->
                <div class="card-body">
                    <div class="table-wrapper">
                        <table class="table " id="datatable1">
                            <thead>
                                <th>No</th>
                                {{-- <th>Project</th> --}}
                                <th width="30%">Desc</th>
                                <th>Type</th>
                                <th>Unit</th>
                                {{-- <th>Date</th> --}}
                                <th>Qty</th>
                                <th>PO</th>
                                <th>Project</th>
                                <th>Warehouse At</th>
                                 
                            </thead>
                            <tbody>
                                @php
                                $no=1;
                                @endphp
                                @foreach ($items as $item)

                                <tr>
                                    <td>{{$no++}}</td>
                                    <td>{{$item->description}}</td>
                                    <td>{{$item->type}}</td>
                                    <td>{{$item->unit}}</td>
                                    <td>{{$item->qty}}</td>
                                    <td>{{$item->po->po_number}}</td>
                                    <td>{{$item->po->pr->project->name}}</td>
                                    <td>{{$item->created_at}}</td>
                                    
                                   
                                   

                                </tr>
                                @endforeach
                            </tbody>

                        </table>
                    </div>
                </div>
            </div>
        </div>

    </div>
 


</div><!-- br-pagebody -->
@push('scripts')

@endpush
@include('layouts.partials.footer')
</div><!-- br-mainpanel -->
@endsection
