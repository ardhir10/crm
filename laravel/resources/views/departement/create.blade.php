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
                        {{-- <a href="{{url('departements/create')}}"> <button
                            class="btn btn-sm btn-danger float-right"><i class="icon ion ion-ios-plus-outline"></i>
                            New
                            Data</button>
                        </a> --}}
                        <hr>
                        <form method="POST" action="{{ route('departements.store') }}">
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
                                <label for="">Name</label>
                                <input class="form-control{{ $errors->has('name') ? ' is-invalid' : '' }}" type="text" name="name"
                            placeholder="input departement name" value="{{old('name')}}">
                                @if ($errors->has('name'))
                                    <small class="text-danger">{{ $errors->first('name') }}</small>
                                @endif
                            </div>

                            <div class="form-group">
                                <label for="">Description <small>(Optional</small>)</label>
                                <textarea name="description" class="form-control" id="" cols="30" rows="3">{{old('description')}}</textarea>
                            </div>

                            <div class="form-group has-danger {{ $errors->has('privileges') ? ' has-danger' : '' }}">
                                <label for="">Privileges</label>
                                <br>
                                <small>Select All</small>
                                <input type="checkbox" id="checkbox">
                                <select class="form-control select2 " name="privileges[]" id="e1"
                                    data-placeholder="Choose one (with optgroup)" multiple>
                                    {{-- <option label="Choose one"></option> --}}
                                    @foreach ($privileges as $privilege)
                                    <option value="{{$privilege->id}}" 
                                    @if (old('privileges') == $privilege->id)
                                        {{ 'selected:selected' }}
                                    @endif
                                    >
                                    
                                    {{$privilege->name}}</option>

                                    @endforeach
                                </select>
                                @if ($errors->has('name'))
                                    <small class="text-danger">{{ $errors->first('privileges') }}</small>
                                @endif
                            </div>
                            <div class="form-group">
                                <button class="btn   btn-success" type="submit"><i class="far fa-save"></i>
                                    Save</button>
                                <a href="{{ url('departements') }}"><button class="btn   btn-danger" type="button"><i
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


@push('scripts')
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
                @foreach (old('privileges') as $privilege_selected)
                    {!! $privilege_selected !!},  
                @endforeach 
        ]);
        </script>
    @endif
@endpush
