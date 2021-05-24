@extends('layouts.main')

@section('page_title',$page_title)

@section('css')
<style>
    .select2-results__option[aria-selected=true] {
        display: none;
    }

</style>

@endsection

@section('content')
<div class="br-mainpanel">
    <div class="br-pageheader">
        <div w>
            <nav class="breadcrumb pd-0 mg-0 tx-12">
                <a class="breadcrumb-item" href="index.html">{{config('app.name')}}</a>
                <span class="breadcrumb-item active">{{$page_title}}</span>

            </nav>

        </div>
    </div><!-- br-pageheader -->


    <div class="br-pagebody">

        <div class="row">

            <div class="col-lg-6 mg-b-20">
                <div class="br-section-wrapper" style="padding: 30px 20px">
                    <div style="align">
                        <span class="tx-bold tx-18">{{$page_title}}</span>
                        {{-- <a href="{{url('items/create')}}"> <button class="btn btn-sm btn-danger float-right"><i
                                class="icon ion ion-ios-plus-outline"></i>
                            New
                            Data</button>
                        </a> --}}
                        <hr>
                        <form method="POST" action="{{ url($base_route.'/store') }}">
                        {{-- <form method="POST" action="{{ route($base_route.'.store') }}"> --}}
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
                            <div class="form-group ">
                                <label for="">Description</label><span class="text-danger">*</span>

                                <textarea class="form-control{{ $errors->has('description') ? ' is-invalid' : '' }}"
                                    name="description" id="" cols="30" rows="3">{{old('description')}}</textarea>

                                @if ($errors->has('description'))
                                <small class="text-danger">{{ $errors->first('description') }}</small>
                                @endif
                            </div>

                            <div class="form-group ">
                                <label for="">Type</label>
                                <input type="text" class="form-control{{ $errors->has('type') ? ' is-invalid' : '' }}"
                                    name="type" value="{{old('type')}}">

                                @if ($errors->has('type'))
                                <small class="text-danger">{{ $errors->first('type') }}</small>
                                @endif
                            </div>

                            <div class="form-group ">
                                <label for="">MFG</label>
                                <input type="text" class="form-control{{ $errors->has('mfg') ? ' is-invalid' : '' }}"
                                    name="mfg" value="{{old('mfg')}}">

                                @if ($errors->has('mfg'))
                                <small class="text-danger">{{ $errors->first('mfg') }}</small>
                                @endif
                            </div>

                            <div class="form-group ">
                                <label for="">QTY</label>
                                <span class="text-danger">*</span>
                                <input type="number" class="form-control{{ $errors->has('qty') ? ' is-invalid' : '' }}"
                                    name="qty" value="{{old('qty')}}">

                                @if ($errors->has('qty'))
                                <small class="text-danger">{{ $errors->first('qty') }}</small>
                                @endif
                            </div>

                            <div class="form-group ">
                                <label for="">Unit</label>
                                <span class="text-danger">*</span>
                                <input type="text" class="form-control{{ $errors->has('unit') ? ' is-invalid' : '' }}"
                                    name="unit" value="{{old('unit')}}">

                                @if ($errors->has('unit'))
                                <small class="text-danger">{{ $errors->first('unit') }}</small>
                                @endif
                            </div>

                            <div class="form-group ">
                                <label for="">Price</label>
                                <span class="text-danger">*</span>
                                <input type="number"
                                    class="form-control{{ $errors->has('price') ? ' is-invalid' : '' }}" name="price"
                                    value="{{old('price')}}">

                                @if ($errors->has('price'))
                                <small class="text-danger">{{ $errors->first('price') }}</small>
                                @endif
                            </div>

                            <div class="form-group ">
                                <label for="">Disc</label>
                                <input type="number" class="form-control{{ $errors->has('disc') ? ' is-invalid' : '' }}"
                                    name="disc" value="{{old('disc')}}">

                                @if ($errors->has('disc'))
                                <small class="text-danger">{{ $errors->first('disc') }}</small>
                                @endif
                            </div>

                            <div class="form-group ">
                                <label for="">Total Cost</label>
                                <input type="number"
                                    class="form-control{{ $errors->has('total_cost') ? ' is-invalid' : '' }}"
                                    name="total_cost" value="{{old('total_cost')}}">

                                @if ($errors->has('total_cost'))
                                <small class="text-danger">{{ $errors->first('total_cost') }}</small>
                                @endif
                            </div>





                            <div class="form-group">
                                <button class="btn   btn-success" type="submit"><i class="far fa-save"></i>
                                    Save</button>
                                <a href="{{ url($base_route) }}"><button class="btn   btn-danger" type="button"><i
                                            class="far fa-arrow-alt-circle-left"></i> Cancel</button></a>

                            </div>
                        </form>
                    </div>
                    <hr>

                </div>

            </div>

        </div>

    </div><!-- br-pagebody -->

    @include('layouts.partials.footer')
</div><!-- br-mainpanel -->
@endsection


@section('js')
<script>
    $("#e1").select2();
    $("#checkbox").click(function () {
        if ($("#checkbox").is(':checked')) {
            $("#e1 > option").prop("selected", "selected");
            $("#e1").trigger("change");
        } else {
            $("#e1 > option").removeAttr("selected");
            $("#e1").val("");
            $("#e1").trigger("change");
        }
    });

    $("#button").click(function () {
        alert($("#e1").val());
    });

    $("select").on("select2:select", function (evt) {
        var element = evt.params.data.element;
        var $element = $(element);
        $element.detach();
        $(this).append($element);
        $(this).trigger("change");
    });

</script>

@if (old('privileges'))
<script>
    $("#e1").val([
        @foreach(old('privileges') as $privilege_selected) {
            !!$privilege_selected!!
        },
        @endforeach
    ]);

</script>
@endif
@endsection
