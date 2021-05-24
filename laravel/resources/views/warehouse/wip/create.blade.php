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


        <div class="col-lg-4">
            <h6 class="card-title">{{$page_title}}</h6>
            <div class="card">
               
                <div class="card-header">
                        
                {{-- <a href="{{url($base_route.'/wip/create')}}">
                                <button class="btn btn-sm  float-right btn-info"><i
                                    class="icon ion ion-ios-plus-outline"></i> New data</button>
                        </a> --}}
                </div><!-- card-header -->
                <div class="card-body">
                    <div class="table-wrapper">
                    <form action="{{url($base_route.'/wip')}}" method="POST">
                        @csrf
                        @if ($errors->any())
                        <div class="alert alert-danger">
                            <ul>
                                @foreach ($errors->all() as $error)
                                <li>{{ $error }}</li>
                                @endforeach
                            </ul>
                        </div>
                        @endif
                           <div class="form-group">
                               <label for="">WIP NUMBER <span class="text-danger">*</span>: </label>
                               <input type="text" class="form-control{{ $errors->has('wip_number') ? ' is-invalid' : '' }}" value="{{$wip_number}}" name="wip_number" readonly required>
                           </div>

                           <div class="form-group">
                                <label for="">REQUEST BY : </label>
                                <input type="text" class="form-control{{ $errors->has('request_by') ? ' is-invalid' : '' }}" name="request_by">
                            </div>

                            <div class="form-group">
                                <label for="">DESCRIPTION : </label>
                                <textarea  class="form-control"  name="description" id="" cols="30" rows="5"></textarea>
                            </div>

                            <div class="form-group">
                            <a href="{{url($base_route.'/wip')}}" class="btn  btn-danger"><i class="ion-arrow-left-a"></i> Back</a>
                                <button type="submit" class="btn  btn-teal"><i class="ion-arrow-right-a"></i> Continue Create </button>                                 
                            </div>
                       </form>
                    </div>
                </div>
            </div>
        </div>

    </div>



    {{-- <div class="row no-gutters widget-1 shadow-base">
        <div class="col-sm-6 col-lg-3">
            <div class="card">
                <div class="card-header">
                    <h6 class="card-title">Today's Sales</h6>
                    <a href=""><i class="icon ion-android-more-horizontal"></i></a>
                </div><!-- card-header -->
                <div class="card-body">
                    <span id="spark1"><canvas width="89" height="30"
                            style="display: inline-block; width: 89px; height: 30px; vertical-align: top;"></canvas></span>
                    <span>$1,850</span>
                </div><!-- card-body -->
                <div class="card-footer">
                    <div>
                        <span class="tx-11">Gross Sales</span>
                        <h6 class="tx-inverse">$2,210</h6>
                    </div>
                    <div>
                        <span class="tx-11">No. of Items</span>
                        <h6 class="tx-inverse">68</h6>
                    </div>
                    <div>
                        <span class="tx-11">Tax Return</span>
                        <h6 class="tx-danger">$320</h6>
                    </div>
                </div><!-- card-footer -->
            </div><!-- card -->
        </div><!-- col-3 -->
        <div class="col-sm-6 col-lg-3 mg-t-1 mg-sm-t-0">
            <div class="card">
                <div class="card-header">
                    <h6 class="card-title">This Week's Sales</h6>
                    <a href=""><i class="icon ion-android-more-horizontal"></i></a>
                </div><!-- card-header -->
                <div class="card-body">


                    <span id="spark2"><canvas width="89" height="30"
                            style="display: inline-block; width: 89px; height: 30px; vertical-align: top;"></canvas></span>
                    <span class="tx-medium tx-inverse tx-32">$3,324</span>
                </div><!-- card-body -->
                <div class="card-footer">
                    <div>
                        <span class="tx-11">Gross Sales</span>
                        <h6 class="tx-inverse">$5,471</h6>
                    </div>
                    <div>
                        <span class="tx-11">Purchase</span>
                        <h6 class="tx-inverse">211</h6>
                    </div>
                    <div>
                        <span class="tx-11">Tax Return</span>
                        <h6 class="tx-danger">$1,988</h6>
                    </div>
                </div><!-- card-footer -->
            </div><!-- card -->
        </div><!-- col-3 -->
        <div class="col-sm-6 col-lg-3 mg-t-1 mg-lg-t-0">
            <div class="card">
                <div class="card-header">
                    <h6 class="card-title">This Month's Sales</h6>
                    <a href=""><i class="icon ion-android-more-horizontal"></i></a>
                </div><!-- card-header -->
                <div class="card-body">
                    <span id="spark3"><canvas width="89" height="30"
                            style="display: inline-block; width: 89px; height: 30px; vertical-align: top;"></canvas></span>
                    <span>$12,324</span>
                </div><!-- card-body -->
                <div class="card-footer">
                    <div>
                        <span class="tx-11">Gross Sales</span>
                        <h6 class="tx-inverse">$18,433</h6>
                    </div>
                    <div>
                        <span class="tx-11">Purchase</span>
                        <h6 class="tx-inverse">654</h6>
                    </div>
                    <div>
                        <span class="tx-11">Tax Return</span>
                        <h6 class="tx-danger">$3,314</h6>
                    </div>
                </div><!-- card-footer -->
            </div><!-- card -->
        </div><!-- col-3 -->
        <div class="col-sm-6 col-lg-3 mg-t-1 mg-lg-t-0">
            <div class="card">
                <div class="card-header">
                    <h6 class="card-title">Overall Sales</h6>
                    <a href=""><i class="icon ion-android-more-horizontal"></i></a>
                </div><!-- card-header -->
                <div class="card-body">
                    <span id="spark4"><canvas width="89" height="30"
                            style="display: inline-block; width: 89px; height: 30px; vertical-align: top;"></canvas></span>
                    <span>$32,324</span>
                </div><!-- card-body -->
                <div class="card-footer">
                    <div>
                        <span class="tx-11">Gross Sales</span>
                        <h6 class="tx-inverse">$56,433</h6>
                    </div>
                    <div>
                        <span class="tx-11">Purchases</span>
                        <h6 class="tx-inverse">1,654</h6>
                    </div>
                    <div>
                        <span class="tx-11">Tax Return</span>
                        <h6 class="tx-danger">$15,354</h6>
                    </div>
                </div><!-- card-footer -->
            </div><!-- card -->
        </div><!-- col-3 -->
    </div> --}}


</div><!-- br-pagebody -->
@push('scripts')
<script>
    $(document).ready(function () {
        var route_url = '{{url($base_route)}}';


    });

</script>

@endpush
@include('layouts.partials.footer')
</div><!-- br-mainpanel -->
@endsection
