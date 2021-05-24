@extends('layouts.main')



@section('page_title',$page_title)





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



		<div class="row">



			<div class="col-lg-12 mg-b-20">

				<div class="br-section-wrapper" style="padding: 30px 20px">

					<div style="align">

						<span class="tx-bold tx-18"><i class="icon ion ion-ios-people tx-22"></i> {{$page_title}}</span>

						<a href="{{url($base_route.'/create') }}">

							<button class="btn btn-sm btn-info float-right"><i
									class="icon ion ion-ios-plus-outline"></i>

								New

								Data</button>

						</a>

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

					<div class="table-wrapper ">

						<table class="table display  nowrap" id="datatable1">

							<thead>

								<tr>

									<th>NO</th>

									<th>PROJECT NUMBER</th>

									<th>NAME</th>

									<th>DESCRIPTION</th>

									<th>CUSTOMER</th>

									<th width="15%">Action</th>

								</tr>

							</thead>

							<tbody>

								@php

								$no=1;

								@endphp

								@foreach ($projects as $project)





								<tr>

									<td>{{ $no++ }}</td>

									<td>{{ $project->project_number }}</td>

									<td>{{ $project->name }}</td>

									<td>{{ $project->description }}</td>

									<td>{{ $project->customer['name'] }}</td>









									<td>



										<a href="{{url($base_route.'/'.$project->id.'/items/') }}">

											<button class="btn btn-info btn-sm text-white">

												<i class="icon icon ion ion-android-list"></i> Items

											</button>

										</a>





										<a href="{{url($base_route.'/'.$project->id.'/edit/') }}">

											<button class="btn btn-warning btn-sm text-white">

												<i class="icon icon ion ion-edit"></i>



											</button>

										</a>





										@if($project->pr()->count() == 0)
										<button class="btn btn-danger btn-sm text-white"
											onclick="deleteData({{$project->id}})">

											<i class="icon icon ion ion-ios-trash-outline"></i>

										</button>
										@endif



									</td>

								</tr>

								@endforeach

							</tbody>



						</table>

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
	var route_url = '{{$base_route}}';

</script>

@endpush
