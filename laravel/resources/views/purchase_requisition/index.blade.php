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

                <span class="breadcrumb-item active">{{$page_title}}</span>



            </nav>



        </div>

    </div><!-- br-pageheader -->





    <div class="br-pagebody">



        <div class="row  mg-b-20">

            <div class="col-lg-4 ">

                <div class="br-section-wrapper  rounded-20 mg-b-20" style="padding: 30px 20px">

                    <div style="align">

                        <span class="tx-bold tx-18"><i class="icon ion ion-clipboard tx-22"></i> {{$page_title}}</span>

                        {{-- <a href="{{url($base_route.'/create') }}">

                        <button class="btn btn-sm btn-info float-right"><i class="icon ion ion-ios-plus-outline"></i>

                            New

                            Data</button>

                        </a> --}}

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

                            <form action="" method="get">

                                <div class="form-group">

                                    {{-- <label for="">Search Project</label>

                                            <input type="text" class="form-control"> --}}

                                    <div class="input-group    transition">

                                        <input id="searchbox" type="text" class="form-control"

                                            placeholder="Search Project" name="project">

                                        <span class="input-group-btn">

                                            <button class="btn btn-info" type="submit"><i

                                                    class="fas fa-search"></i></button>

                                        </span>

                                    </div>

                                </div>

                            </form>



                        </div>

                    </div>



                    {{-- {{ $users->link    s() }} --}}

                </div>



            </div>



            <div class="col-lg-8">

                <div class="br-section-wrapper  rounded-20 mg-b-20" style="padding: 30px 20px">



                    <div class="row">

                        <div class="col-lg-4 ">

                            <div class="card card-body tx-white-8 bg-dance bd-0 rounded-10 mg-b-20">

                                <div class="  d-flex align-items-center">

                                    {{-- <i class="ion ion-clipboard tx-60 lh-0 tx-white op-7"></i> --}}

                                    <img src="{{asset('backend/icons/other/icons8_purchase_order_64px_1.png')}}"

                                        class="img-fluid" alt="">



                                    <div class="mg-l-20">

                                        <p

                                            class="tx-10 tx-spacing-1 tx-mont tx-semibold tx-uppercase tx-white-8 mg-b-10">

                                            Total PR</p>

                                        <p class="tx-24 tx-white tx-lato tx-bold mg-b-0 lh-1">

                                            {{$purchase_requisition->count()}}</p>

                                    </div>

                                </div>

                            </div>

                        </div>



                        <div class="col-lg-4 ">

                            <div class="card card-body tx-white-8 bg-teal bd-0 rounded-10 mg-b-20">

                                <div class="  d-flex align-items-center">

                                    {{-- <i class=" fa fa-thumbs-up tx-60  tx-white op-7"></i> --}}

                                    <img src="{{asset('backend/icons/other/icons8_checked_64px.png')}}" class="img-fluid">



                                    <div class="mg-l-20">

                                        <p

                                            class="tx-10 tx-spacing-1 tx-mont tx-semibold tx-uppercase tx-white-8 mg-b-10">

                                            Approved PR</p>

                                        <p class="tx-24 tx-white tx-lato tx-bold mg-b-0 lh-1">

                                            {{$purchase_requisition_approved->count()}}</p>

                                    </div>

                                </div>

                            </div>

                        </div>



                        <div class="col-lg-4 ">

                            <div class="card card-body tx-white-8 bg-danger bd-0 rounded-10 mg-b-20">

                                <div class="  d-flex align-items-center">

                                    {{-- <i class="fa fa-thumbs-down tx-60 -0 tx-white op-7"></i> --}}

                                    <img src="{{asset('backend/icons/other/icons8_cancel_2_64px.png')}}" class="img-fluid"

                                        alt="">



                                    <div class="mg-l-20">

                                        <p

                                            class="tx-10 tx-spacing-1 tx-mont tx-semibold tx-uppercase tx-white-8 mg-b-10">

                                            Canceled PR</p>

                                        <p class="tx-24 tx-white tx-lato tx-bold mg-b-0 lh-1">

                                            {{$purchase_requisition_canceled->count()}}</p>

                                    </div>

                                </div>

                            </div>

                        </div>



                    </div>



                </div>

            </div>



        </div>

        {{--

        <div class="br-pagetitle mg-b-10">

            <i class="icon icon ion-ios-briefcase-outline"></i>

            <div>

                <h4>List Project :</h4>



                <form action="">



                    <div class="input-group form-group hidden-xs-down wd-170 transition">

                            <input id="searchbox" type="text" class="form-control" placeholder="Search Project">

                            <span class="input-group-btn">

                              <button class="btn btn-info" type="button"><i class="fa fa-search"></i></button>

                            </span>

                          </div>

                </form>



                   <p class="mg-b-0">Use border utilities to quickly style the border and border-radius of an element.</p>

            </div>

        </div> --}}



        <div class="row">

            @foreach ($projects as $project)

            <div class="col-sm-6  col-lg-3">

                <a href="{{url($base_route.'/'.$project->id)}}">

                    <div class="card shadow-base bd-0  card__one mg-b-20 rounded-20">

                        <div class="card-header bg-mantle d-flex justify-content-between align-items-center"

                            style=" border-radius: 122px;border-bottom-left-radius: 0px;">

                            <h6 class="card-title text-white tx-uppercase tx-12 mg-b-0">{{ custom_echo($project->name,23)}}</h6>

                            <span

                                class="tx-12 text-white tx-uppercase">{{date('d M Y',strtotime($project->created_at))}}</span>

                        </div><!-- card-header -->

                        <div class="card-body">

                            <p class="tx-sm tx-inverse tx-medium mg-b-0">{{$project->customer['name'] }}</p>

                            <p class="tx-12">{{$project->project_number}}</p>

                            <p class="tx-12">{{$project->description}}</p>

                            <div class="row align-items-center">

                                {{-- <div class="col-3 tx-12"> PR </div><!-- col-3 --> --}}

                                @if ($project->pr()->get()->count() == 0)

                                @php

                                $badge = 'badge-danger';

                                @endphp

                                @else

                                @php

                                $badge = 'badge-info';

                                @endphp

                                @endif





                                @if ($project->items()->get()->count() == 0)

                                @php

                                $badge_it = 'badge-danger';

                                @endphp

                                @else

                                @php

                                $badge_it = 'badge-info';

                                @endphp

                                @endif







                                <div class="col-12">

                                    <span class="badge {{$badge}}"> {{$project->pr()->get()->count() }}</span> PR in

                                    Project

                                </div><!-- col-9 -->

                                {{-- <div class="col-3 tx-12">Item :</div><!-- col-3 --> --}}

                                <div class="col-12">

                                    <span class="badge {{$badge_it}}"> {{$project->items()->get()->count() }}</span>

                                    Items

                                    in Project

                                </div><!-- col-9 -->

                                <div class="col-12">

                                    <div style="text-align:right ">

                                        <i class="icon fa fa-thumbs-up text-success">

                                            {{$project->pr()->where('status',1)->get()->count() }}</i>

                                        <i class="icon fa fa-thumbs-down text-danger">

                                            {{$project->pr()->where('status',0)->get()->count() }}</i>

                                    </div>

                                </div><!-- col-9 -->

                            </div><!-- row -->

                            {{-- <div class="row align-items-center mg-t-5">

                                    <div class="col-3 tx-12">CPU2</div><!-- col-3 -->

                                    <div class="col-9">

                                        <div class="progress rounded-0 mg-b-0">

                                            <div class="progress-bar bg-pink wd-90p lh-3" role="progressbar" aria-valuenow="90"

                                                aria-valuemin="0" aria-valuemax="100">90%</div>

                                        </div><!-- progress -->

                                    </div><!-- col-9 -->

                                </div><!-- row --> --}}

                            {{-- <p class="tx-11 mg-b-0 mg-t-15">Notice: Lorem ipsum dolor sit amet.</p> --}}

                        </div><!-- card-body -->

                    </div><!-- card -->

                </a>

            </div>

            @endforeach











        </div>

        <div style="display:block">

            {{ $projects->links() }}

        </div>



    </div><!-- br-pagebody -->

    @php

    function custom_echo($x, $length)
    {
        if(strlen($x)<=$length)
        {
            echo $x;
        }
        else
        {
            $y=substr($x,0,$length) . '...';
            echo $y;
        }
    }
    @endphp

    @include('layouts.partials.footer')

</div><!-- br-mainpanel -->\





@endsection



@push('scripts')

<script>

    var route_url = '{{$base_route}}';



</script>

@endpush
