@extends('layouts.main')



@section('page_title',$page_title)

<style>
	.dataTables_wrapper .dataTables_processing {

		position: absolute;

		top: 0% !important;

		left: 50% !important;

		width: 100% !important;

		height: 90% !important;

		margin-left: -20%;

		margin-top: -25px;

		padding-top: 20px;

		text-align: center;

		font-size: 1.2em;

		background: #ffffff7a !important;

		z-index: 9999;

	}



	.center-vh {

		margin: auto;

		width: 50%;

		border: 3px solid green;

		padding: 10px;

	}

</style>







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

						<span class="tx-bold tx-18"><i class="icon ion ion-ios-box tx-22"></i> {{$page_title}}</span>

						<a href="{{url($base_route.'/create') }}">

							<button class="btn btn-sm btn-info float-right"><i
									class="icon ion ion-ios-plus-outline"></i>

								New

								Data</button>

						</a>



						<button class="btn btn-sm btn-success mg-r-10 float-right" data-toggle="modal"
							data-target="#modaldemo1">

							<img src="{{asset('icons/other/icons8_ms_excel_filled_12px.png')}}" class="img-fluid"
								alt="">



							{{-- <i class="icon ion ion-ios-upload-outline"></i> --}}

							Import Excel</button>



						<input type="button" id="delete_value" class="btn btn-sm btn-danger mg-r-10 float-right"
							name="save_value" value="Delete Selected" />



						{{-- 

                            <button id="save_value" class="btn btn-sm btn-danger mg-r-10 float-right" ><i class="icon ion ion-ios-trash"></i>

                            Delete Selected</button> --}}

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

						{!! session()->get('delete') !!}

						<button type="button" class="close" data-dismiss="alert" aria-label="Close">

							<span aria-hidden="true">&times;</span>

						</button>



					</div>

					@endif

					@if ($errors->any())

					<div class="alert alert-danger">

						<ul>

							@foreach ($errors->all() as $error)

							<li>{{ $error }}</li>

							@endforeach

						</ul>

					</div>

					@endif

					<div class="table-wrapper table-responsive">



						<table class="table display  " id="table">

							<thead>

								<tr>



									<th>NO</th>

									<th style="" style="width:5px !importantR" width="1% !important">

										<button type="button" id='selectAll' class="btn btn-sm btn-info"> <i
												class="ion ion-android-checkbox-outline"></i></button>
										{{-- Select This Page --}}

										{{-- <input type="button" id='delete_record' value='Delete'> --}}

									</th>
									{{-- <th>DESCRIPTION</th> --}}

									<th>DESCRIPTION</th>


									<th>TYPE</th>

									<th>MFG</th>

									<th>QTY</th>

									<th>UNIT</th>

									<th>PRICE</th>

									<th>DISC</th>

									{{-- <th>TOTAL COST</th> --}}
									<th>DATE</th>


									<th width="15%">Action</th>


								</tr>

							</thead>

							<tbody></tbody>

							<tfoot>

								<tr>



									<th>NO</th>

									<th >

									</th>

									{{-- <th>DESCRIPTION</th> --}}
									<th>DESCRIPTION</th>


									<th>TYPE</th>

									<th>MFG</th>

									<th>QTY</th>

									<th>UNIT</th>

									<th>PRICE</th>

									<th>DISC</th>

									{{-- <th>TOTAL COST</th> --}}
									<th>DATE</th>

									<th width="15%">Action</th>


								</tr>

							</tfoot>

							{{-- <tbody>

                                @php

                                $no=1;

                                @endphp

                                @foreach ($items as $item)





                                <tr>

                                    <td>{{ $no++ }}</td>

							<td>{{ $item->description }}</td>

							<td>{{ $item->type }}</td>

							<td>{{ $item->mfg }}</td>

							<td>{{ $item->qty }}</td>

							<td>{{ $item->unit }}</td>

							<td>{{ $item->price }}</td>

							<td>{{ $item->disc }}</td>

							<td>{{ $item->total_cost }}</td>





							<td>

								<a href="{{url($base_route.'/'.$item->id.'/edit/') }}">

									<button class="btn btn-warning btn-sm text-white">

										<i class="icon icon ion ion-edit"></i> Edit



									</button>

								</a>

								<button class="btn btn-danger btn-sm text-white" onclick="deleteData({{$item->id}})">

									<i class="icon icon ion ion-ios-trash-outline"></i> Delete

								</button>

							</td>

							</tr>

							@endforeach

							</tbody> --}}



						</table>

					</div>

					{{-- {{ $users->link    s() }} --}}

				</div>



			</div>



		</div>



	</div><!-- br-pagebody -->



	@include('layouts.partials.footer')

</div><!-- br-mainpanel -->\



<form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">

	@csrf

</form>



<!-- ADD ITEM MODAL -->

<div id="modaldemo1" class="modal fade">

	<div class="modal-dialog modal-sm modal-dialog-centered" role="document">

		<div class="modal-content bd-0 tx-14">

			{{-- <div class="modal-header pd-y-20 pd-x-25">

                <h6 class="tx-14 mg-b-0 tx-uppercase tx-inverse tx-bold">Add Item</h6>

                <button type="button" class="close" data-dismiss="modal" aria-label="Close">

                    <span aria-hidden="true">&times;</span>

                </button>

            </div> --}}

			<form action="{{url('/impor/import_excel')}}" method="post" enctype="multipart/form-data">

				@csrf



				<div class="modal-body pd-25">

					<div class="form-group">

						<label for="">Upload Excel :</label>

						<input type="file" name="file" class="form-control">

					</div>



					<a href="{{url('/download/SampleImportItems.xlsx')}}"><img
							src="{{asset('icons/other/icons8_ms_excel_25px.png')}}" class="img-fluid" alt="">

						Download sample file</a>

				</div>

				<div class=" modal-footer">

					<button class="btn btn-sm btn-success tx-11 tx-uppercase pd-y-12 pd-x-25 tx-mont tx-medium"
						type="submit">Import</button>

					<button type="button"
						class="btn btn-sm btn-secondary tx-11 tx-uppercase pd-y-12 pd-x-25 tx-mont tx-medium"
						data-dismiss="modal">Close</button>

				</div>

			</form>

		</div>

	</div><!-- modal-dialog -->

</div><!-- modal -->

@endsection



@push('scripts')

<script>
	var route_url = '{{$base_route}}';



	$(function () {



		var table = $('#table').DataTable({

			responsive: false,
            lengthMenu: [[10, 25, 50, -1], [10, 25, 50, "All"]],

			language: {

				searchPlaceholder: 'Search...',

				sSearch: '',

				lengthMenu: '_MENU_ items/page',

			},

			language: {

				processing: '<div class="" style="position: relative;top: 41%;"><i class="fa fa-spinner fa-spin fa-3x fa-fw mg-t-20"></i><span class="sr-only">Loading...</span></div> '

			},

			// stateSave: true,

			processing: true,

			serverSide: true,

			ajax: {

				url: '{{$base_route}}/json',

				data: function (outData) {

					// what is being sent to the server

					// console.log(outData);

					return outData;

				},

				dataFilter: function (inData) {

					// what is being sent back from the server (if no error)

					// console.log(inData);

					return inData;

				},

				error: function (err, status) {

					// what error is seen(it could be either server side or client side.

					// console.log(err);

				},

			},

			columns: [





				{

					data: "DT_RowIndex",

					name: 'DT_RowIndex'



					// render: function (data, type, row, meta) {

					//     return meta.row + meta.settings._iDisplayStart + 1 +

					//         '<span style="display:none">' + data + '</span>';

					//     // return ;

					// }

				},

				{
					
					data: 'id',

					name: 'checkbox',

					render: function (data, type, full, meta) {

						return `<input name="selector[]" class="item-checkbox checkItem" type="checkbox"  value="` +

							data + `" >`;

					},
					// width: '50px', 
					class: 'wd-10p',

					orderable: false

				},

				// {

				// 	data: 'description',



				// 	render: function (data, type, full, meta) {

				// 		return fn(data, 10);

				// 	},

				// },

				{

					data: 'description',

					name: 'description'

				},


				

				{

					data: 'type',

					name: 'type'

				},

				{

					data: 'mfg',

					name: 'mfg'

				},

				{

					data: 'qty',

					name: 'qty'

				},

				{

					data: 'unit',

					name: 'unit'

				},

				{

					data: 'price',

					render: $.fn.dataTable.render.number(',', '.', 0, 'Rp. '),

					name: 'price'

				},

				{

					data: 'disc',

					name: 'disc'

				},
				{

				data: 'created_at',

				name: 'created_at'

				},


				// {

				// 	data: 'total_cost',

				// 	render: $.fn.dataTable.render.number(',', '.', 0, 'Rp. '),

				// 	name: 'total_cost'

				// },

				{

					data: 'id',

					name: 'button',

					render: function (data, type, full, meta) {

						return `<a href="{{url($base_route.'/` + data + `/edit/') }}">

                                <button class="btn btn-warning btn-sm text-white">

                                    <i class="icon icon ion ion-edit"></i> Edit



                                </button>

                            </a>

                            <button class="btn btn-danger btn-sm text-white"

                                onclick="deleteData(` + data + `)">

                                <i class="icon icon ion ion-ios-trash-outline"></i> Delete

                            </button>`;

					},

					orderable: false

				},




			],





		});



		var allPages = table.cells().nodes();

		// alert('Kakak');

		$("#selectAll").on("click", function () {

			// table.$("input[type='checkbox']").attr('checked', $(this.checked));  

			if (allPages.$("input[type='checkbox']").is(":checked")) {

				allPages.$("input[type='checkbox']").prop('checked', false);

			} else {

				allPages.$("input[type='checkbox']").prop('checked', $(this.checked));

			}

		});



		function fn(text, count) {

			return text.slice(0, count) + (text.length > count ? "..." : "");

		}



		$('#table tfoot th').each(function () {

			var title = $(this).text();

			if (title != 'NO')

				$(this).html('<input type="text" class="form-control-sm" placeholder="Search ' + title +

					'" />');

		});







		// Apply the search

		table.columns().every(function () {

			var that = this;



			$('input', this.footer()).on('keyup change clear', function () {

				if (that.search() !== this.value) {

					that

						.search(this.value)

						.draw();

				}

			});

		});

	});



	$(function () {

		$('#delete_value').click(function () {

			var val = [];

			$(':checkbox:checked.checkItem').each(function (i) {

				val[i] = $(this).val();

			});

			deleteSelectedData(val)

			// console.log(val);

		});

	});





	function deleteSelectedData(ids) {

		$.confirm({



			theme: 'material',

			title: 'Confirm!',

			content: 'Are you sure you want to delete data ?',

			buttons: {

				confirm: function () {

					$.ajax({

						url: route_url + '/delete-seleted',

						dataType: 'json',

						type: 'POST',



						headers: {

							'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')

						},

						data: {

							"_token": "{{ csrf_token() }}",

							id_many: ids

						},

						success: function (data) {

							location.reload();

							console.log(data);

						},

						error: function (data) {

							$.alert('Failed!');

							console.log(data);

						}

					});

				},

				cancel: function () {

					$.alert('Canceled!');

				},

				// somethingElse: {

				//     text: 'Something else',

				//     btnClass: 'btn-blue',

				//     keys: ['enter', 'shift'],

				//     action: function () {

				//         $.alert('Something else?');

				//     }

				// }

			}

		});

	}



	// $("#checkAll").click(function () {

	//     $(':checkbox.checkItem').prop('checked', this.checked);

	// });

	// var allChecked = false;

	//header checkbox click handler

	// document.getElementById('table').addEventListener('click', event => {

	//     if ($(event.target).is('thead [type="checkbox"]')) {

	//         //assign global variable to current state

	//         allChecked = $(event.target).prop('checked');

	//         //trigger table re-draw

	//         //     $(':checkbox.checkItem').prop('checked', this.checked);



	//         $('table').DataTable().draw(false);

	//         //prevent click from propagation and swapping column ordering

	//         event.stopPropagation();

	//     }

	// }, true);

</script>

@endpush
