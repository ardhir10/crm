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

    <div class="row  mg-b-20">


        <div class="col-lg-12">
            <div class="row">

                <div class="col-lg-3 ">
                    <div class="card card-body tx-white-8 bg-transfile bd-0 rounded-10 mg-b-20">
                        <div class="  d-flex align-items-center">
                            {{-- <i class="fa fa-shopping-cart tx-60 lh-0 tx-white op-7"></i> --}}
                            <img src="{{asset('icons/other/icons8_purchase_order_64px.png')}}" class="img-fluid" alt="">

                            <div class="mg-l-20">
                                <p class="tx-10 tx-spacing-1 tx-mont tx-semibold tx-uppercase tx-white-8 mg-b-10">
                                    Purchase Orders</p>
                                <p class="tx-24 tx-white tx-lato tx-bold mg-b-0 lh-1">{{$po->count()}}</p>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="col-lg-3 ">
                    <div class="card card-body tx-white-8 bg-success bd-0 rounded-10 mg-b-20">
                        <div class="  d-flex align-items-center">
                            {{-- <i class=" fa fa-object-group tx-60 lh-0  tx-white op-7"></i> --}}
                            <img src="{{asset('icons/other/icons8_exit_64px.png')}}" class="img-fluid" alt="">
                            <div class="mg-l-20">
                                <p class="tx-10 tx-spacing-1 tx-mont tx-semibold tx-uppercase tx-white-8 mg-b-10">
                                    Items In</p>
                                <p class="tx-24 tx-white tx-lato tx-bold mg-b-0 lh-1">{{$item_in}}</p>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-lg-3 ">
                    <div class="card card-body tx-white-8 bg-danger bd-0 rounded-10 mg-b-20">
                        <div class="  d-flex align-items-center">
                            {{-- <i class="fa fa-object-ungroup tx-60 lh-0 tx-white op-7"></i> --}}
                            <img src="{{asset('icons/other/icons8_export_64px.png')}}" class="img-fluid" alt="">
                            <div class="mg-l-20">
                                <p class="tx-10 tx-spacing-1 tx-mont tx-semibold tx-uppercase tx-white-8 mg-b-10">
                                    Items Out </p>
                                <p class="tx-24 tx-white tx-lato tx-bold mg-b-0 lh-1">{{$item_out}}</p>
                            </div>
                        </div>
                    </div>
                </div>

                {{-- <div class="col-lg-3 ">
                    <div class="card card-body tx-white-8 bg-purple bd-0 rounded-10 mg-b-20">
                        <div class="  d-flex align-items-center">
                            <i class="fas fa-sign-in-alt tx-60 lh-0 tx-white op-7"></i>
                            <div class="mg-l-20">
                                <p class="tx-10 tx-spacing-1 tx-mont tx-semibold tx-uppercase tx-white-8 mg-b-10">
                                    Purchase Order</p>
                                <p class="tx-24 tx-white tx-lato tx-bold mg-b-0 lh-1">{{$users->count()}}</p>
            </div>
        </div>
    </div>
</div> --}}



</div>

</div>

</div>

<div class="row   mg-b-20">

    <div class="col-lg-12">
        <div class="card">
            <div class="card-body">
            <h5>Items In at :  {{date('F Y')}}</h5>
                <div class="bd pd-t-30 pd-b-20 pd-x-20"><canvas id="chartBar1" height="100"></canvas></div>
            </div>
        </div>
    </div>

    {{-- <div class="col-lg-3">
            <div class="card">
               
                <div class="card-body">
                        <p>Purchase Order</p>
                        <hr>
                    <div id="chartPie" class="ht-100 ht-sm-200"></div>
                </div>
            </div>
        </div> --}}



</div>

<div class="row   mg-b-20">


    <div class="col-lg-12">
        <div class="card">
            <div class="card-header">
                <h6 class="card-title">Purchase Order</h6>
            </div><!-- card-header -->
            <div class="card-body">
                <div class="table-wrapper">
                    <table class="table " id="datatable1">
                        <thead>
                            <th>No</th>
                            {{-- <th>Project</th> --}}
                            <th>PO Number</th>
                            {{-- <th>Date</th> --}}
                            <th>PR Number</th>
                            <th>Delivered At</th>
                            <th>Warehouse At</th>
                            <th>Status</th>
                            <th> items</th>
                            <th>Project</th>
                        </thead>
                        <tbody>
                            @php
                            $no=1;
                            @endphp
                            @foreach ($last_po as $lpo)

                            <tr>
                                <td>{{$no++}}</td>
                                {{-- <td>{{$lp->project->name}}</td> --}}
                                <td>
                                    <a href="{{url('warehouse/purchase-orders/'.$lpo->id.'/items')}}">
                                        <p class="mg-b-0">{{$lpo->po_number}}</p>
                                    </a>
                                </td>
                                {{-- <td>{{$lpo->created_at}}</td> --}}
                                <td> <a
                                        href="{{url('purchase-requisitions/'.$lpo->pr->id.'/items')}}">{{$lpo->pr->pr_number}}</a>
                                </td>
                                <td>
                                    {{$lpo->delivered_at}}
                                </td>

                                <td>
                                    {{$lpo->warehouse_at}}
                                </td>
                                <td>
                                    @if ($lpo->status == 0)
                                    <span class="btn btn-danger btn-sm rounded-10"> <i class="icon ion ion-card"></i>
                                        Awaiting Payment</span>
                                    @endif

                                    @if ($lpo->status == 1)
                                    <span class="btn btn-success btn-sm rounded-10"><i class="fa fa-truck"></i>
                                        Delivered</span>
                                    @endif

                                    @if ($lpo->status == 2)
                                    <span class="btn btn-dark btn-sm rounded-10"> <i
                                            class="icon ion ion-ios-home-outline"></i> Warehouse</span>
                                    @endif
                                </td>
                                <td>
                                    {{$lpo->items()->count()}}
                                </td>
                                <td>
                                    <small>{{$lpo->pr->project->project_number}}</small>
                                    <br>
                                    {{$lpo->pr->project->name}}
                                </td>



                            </tr>
                            @endforeach
                        </tbody>

                    </table>
                </div>
                {{-- <div class="bd pd-t-30 pd-b-20 pd-x-20"><canvas id="chartBar1" height="100"></canvas></div> --}}
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

        getData();

        function getData() {
            $.ajax({
                url: route_url + '/trending',
                dataType: 'json',
                type: 'GET',

                success: function (data) {
                    drawChart(data.data.tstamp,data.data.total_item);
                },
                error: function (data) {
                    $.alert('Failed!');
                    console.log(data);
                }
            });
        }

        function drawChart(tstamp,items) {
            var ctx1 = document.getElementById('chartBar1').getContext('2d');
            new Chart(ctx1, {
                type: 'line',
                data: {
                    labels: tstamp,
                    datasets: [{
                            // lineTension: 0,
                            label: 'Total Item',
                            data: items,
                            backgroundColor: '#17A2B8',
                            borderColor: '#17A2B8',
                            borderWidth: 3,
                            fill: false
                        },
                        
                    ]
                },
                options: {
                    responsive: true,
        scaleBeginAtZero: false,
                    legend: {
                        display: true,
                        position: 'top',
                        labels: {
                            fontColor: "#000000",
                        }
                    },
                    scales: {
                        yAxes: [{
                            ticks: {
                                beginAtZero: true,
                                fontSize: 10,
                                // max: 100,
                                // max: Math.max.apply(this, items) + 5,
                                // stepSize: 20
                            }
                        }],
                        xAxes: [{
                            ticks: {
                                beginAtZero: true,
                                fontSize: 11
                            }
                        }]
                    }
                }
            });
        }



        // var pieData = [{
        //     name: 'Purchase Order',
        //     type: 'pie',
        //     radius: '50%',
        //     center: ['50%', '50.5%'],
        //     data: [{
        //             value: 335,
        //             name: 'Awaiting',
        //             itemStyle: {
        //                 color: '#DC3545'
        //             },
        //         },
        //         {
        //             value: 310,
        //             name: 'Delivered',
        //             itemStyle: {
        //                 color: '#23BF08'
        //             },
        //         },
        //         {
        //             value: 234,
        //             name: 'Warehouse',
        //             itemStyle: {
        //                 color: '#2E363E'
        //             },
        //         },

        //     ],
        //     label: {
        //         normal: {
        //             fontFamily: 'Roboto, sans-serif',
        //             fontSize: 11
        //         }
        //     },
        //     labelLine: {
        //         normal: {
        //             show: false
        //         }
        //     },
        //     markLine: {
        //         lineStyle: {
        //             normal: {
        //                 width: 1
        //             }
        //         }
        //     }
        // }];

        // var pieOption = {
        //     tooltip: {
        //         trigger: 'item',
        //         formatter: '{a} <br/>{b}: {c} ({d}%)',
        //         textStyle: {
        //             fontSize: 11,
        //             fontFamily: 'Roboto, sans-serif'
        //         }
        //     },
        //     series: pieData
        // };

        // var pie = document.getElementById('chartPie');
        // var pieChart = echarts.init(pie);
        // pieChart.setOption(pieOption);
    });

</script>

@endpush
@include('layouts.partials.footer')
</div><!-- br-mainpanel -->
@endsection
