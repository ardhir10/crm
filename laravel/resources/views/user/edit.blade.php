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
<script type="text/javascript">
    function makeItPassword() {
        document.getElementById("passcontainer")
            .innerHTML = "<input class=\"form-control\" id=\"password\" name=\"password\" type=\"password\"/>";
        document.getElementById("password").focus();
    }

</script>
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
                        <form method="POST" action="{{ route('users.update', $user->id) }}" enctype="multipart/form-data">
                            @csrf
                            <input type="hidden" name="_method" value="PATCH">
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
                                <label for="">Full Name</label>
                                <input class="form-control{{ $errors->has('name') ? ' is-invalid' : '' }}" type="text"
                                    name="name" placeholder="input user name" value="{{$user->name}}">
                                @if ($errors->has('name'))
                                <small class="text-danger">{{ $errors->first('name') }}</small>
                                @endif
                            </div>
                            <div class="form-group ">
                                <label for="">Email</label>
                                <input class="form-control{{ $errors->has('email') ? ' is-invalid' : '' }}" type="email"
                                    name="email" placeholder="input user email" value="{{$user->email}}">
                                @if ($errors->has('email'))
                                <small class="text-danger">{{ $errors->first('email') }}</small>
                                @endif
                            </div>

                            <div class="form-group ">
                                <label for="password" class=" ">{{ __('Password') }}</label>
                                <span id="passcontainer">
                                    <input  id="password" type="password"
                                    class="form-control{{ $errors->has('password') ? ' is-invalid' : '' }}"
                                    name="password" value="" placeholder="">
                                </span>
                                <small>(Don't fill in if it's not changed)</small>

                                @if ($errors->has('password'))
                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $errors->first('password') }}</strong>
                                </span>
                                @endif
                            </div>




                            <div class="form-group   {{ $errors->has('departement_id') ? ' has-danger' : '' }}">
                                <label for="">Departement</label>
                                <br>
                                <select class="form-control select2 " name="departement_id"
                                    data-placeholder="Choose one  ">
                                    <option label="Choose one"></option>
                                    @foreach ($departements as $departement)
                                    <option value="{{$departement->id}}" @if ($user->departement_id == $departement->id)
                                        {{ 'selected=selected'}}
                                        @endif
                                        >{{$departement->name}}</option>

                                    @endforeach
                                </select>
                                @if ($errors->has('name'))
                                <small class="text-danger">{{ $errors->first('privileges') }}</small>
                                @endif
                            </div>

                            <div class="form-group ">
                                <label for="">Avatar</label>
                                <br>
                                <img height="100" class="mg-b-10" src="{{url('backend/images/users/'.$user->avatar)}}" alt="">
                                <br>

                                <input class="form-control{{ $errors->has('avatar') ? ' is-invalid' : '' }}" type="file"
                                    name="avatar" value="{{old('avatar')}}">
                                @if ($errors->has('avatar'))
                                <small class="text-danger">{{ $errors->first('avatar') }}</small>
                                @endif
                            </div>

                            <div class="form-group">
                                <button class="btn   btn-success" type="submit"><i class="far fa-save"></i>
                                    Save</button>
                                <a href="{{ url('users') }}"><button class="btn   btn-danger" type="button"><i
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
