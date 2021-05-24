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
<div class="br-mainpanel" id="app">
    <div class="br-pageheader">
        <div>
            <nav class="breadcrumb pd-0 mg-0 tx-12">
                <a class="breadcrumb-item" href="index.html">{{config('app.name')}}</a>
                <span class="breadcrumb-item ">{{$page_title}}</span>
                <span class="breadcrumb-item ">{{$project->name}}</span>
                <span class="breadcrumb-item active">Create</span>

            </nav>

        </div>
    </div><!-- br-pageheader -->


    <div class="br-pagebody">



        <div class="row">
            <div class="  col-lg-4">
                <div class="card shadow-base bd-0  card__one mg-b-20 rounded-20">
                    <div class="card-header bg-transparent d-flex justify-content-between align-items-center">
                        <h6 class="card-title tx-uppercase tx-12 mg-b-0">Create PR for Project {{$project->name}}</h6>
                    </div><!-- card-header -->
                    <div class="card-body">
                        <div class="row">
                            <div class="col-lg-12">
                                <form action="{{url($base_route)}}" method="post">
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
                                        <label for="">PR Number</label>
                                        <div>
                                            <input type="text" autocomplete="off"
                                                oninput="this.value = this.value.toUpperCase()" v-model="pr_number"
                                                name="pr_number"
                                                class="form-control{{ $errors->has('pr_number') ? ' is-invalid' : '' }}" readonly>
                                            @{{pr_number}}

                                            <input type="hidden" autocomplete="off"
                                                oninput="this.value = this.value.toUpperCase()" v-model="prNumberCheck"
                                                name="pr_number_check"
                                                class="form-control{{ $errors->has('pr_number') ? ' is-invalid' : '' }}">

                                                
                                            <input type="hidden" autocomplete="off" name="project_number"
                                                value="{{$project->project_number}}">

                                        </div>
                                        @if ($errors->has('pr_number'))
                                        <small class="text-danger">{{$errors->first('pr_number')}}</small>
                                        @endif
                                    </div>


                                    <div class="form-group">
                                        <button class="btn btn-success btn-sm">Save</button>
                                        <a href="{{ url($base_route.'/'.$project->id)}}">
                                            <button type="button" class="btn btn-danger btn-sm">Back</button>
                                        </a>

                                    </div>
                                </form>

                            </div>



                        </div>

                    </div><!-- card-body -->
                </div><!-- card -->
            </div>
            {{-- <div class="  col-lg-8">
                <div class="card shadow-base bd-0   mg-b-20 rounded-20">
                    <div class="card-header bg-transparent d-flex justify-content-between align-items-center">
                        <h6 class="card-title tx-uppercase tx-12 mg-b-0">Items {{$project->name}}</h6>
        </div><!-- card-header -->
        <div class="card-body">
            <div class="row">
                <div class="col-lg-12">
                    <div class="table-wrapper">
                        <table class="table " id="datatable1">
                            <thead>
                                <th>No</th>
                                <th>Description</th>
                                <th>Qty</th>
                                <th></th>
                            </thead>
                            <tbody>
                                @php
                                $no=1;
                                @endphp
                                @foreach ($project_items as $project_item)
                                <tr>
                                    <td>{{ $no++ }}</td>
                                    <td>{{ $project_item->description }}</td>
                                    <td>{{ $project_item->qty }}</td>
                                    <td>
                                        <input type="checkbox">
                                    </td>
                                </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>



            </div>

        </div><!-- card-body -->
    </div><!-- card -->
</div> --}}







</div>


</div><!-- br-pagebody -->

@include('layouts.partials.footer')
</div><!-- br-mainpanel -->\


@endsection

@push('scripts')
<script>
    var route_url = '{{$base_route}}';

    var vm = new Vue({
        el: '#app',
        data: {
            pr_number: '{{$pr_number}}'
        },
        computed: {
            prNumberCheck: function () {
                // `this` points to the vm instance
                return this.pr_number
            }
        }
    })

</script>
@endpush
