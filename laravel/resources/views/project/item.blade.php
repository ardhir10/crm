@extends('layouts.main')



@section('page_title',$page_title)



@section('css')

<style>
	.select2-results__option[aria-selected=true] {

		display: none;

	}



	.active-project {

		background-image: linear-gradient(to right, #1CAF9A 0%, #17A2B8 100%);

		background-repeat: repeat-x;

		color: #fff;

	}

</style>



@endsection



@section('content')

<div class="br-mainpanel">

	<div class="br-pageheader">

		<div w>

			<nav class="breadcrumb pd-0 mg-0 tx-12">

				<a class="breadcrumb-item" href="">{{config('app.name')}}</a>

				<a class="breadcrumb-item" href="">Project</a>

				<span class="breadcrumb-item active">{{$page_title}}</span>



			</nav>



		</div>

	</div><!-- br-pageheader -->





	<div class="br-pagebody">



		<div class="row">



			<div class="col-lg-3">

				<div class="card widget-10 shadow-base mg-b-20">

					<div class="card-header">

						<div class="card-title">Other Projects</div>

						<a href="" class="tx-gray lh-0"><i class="fa fa-angle-down"></i></a>

					</div><!-- card-header -->

					<div class="list-group list-group-flush tx-13">

						@php

						$no=1;

						$active = [];

						@endphp

						@foreach ($projects as $project_item)

						@if ($project_item->id == $project->id)

						@php

						$active[$no] = 'active-project';

						@endphp

						@else

						@php

						$active[$no] = '';

						@endphp

						@endif

						<a href="{{url($base_route.'/'.$project_item->id.'/items/') }}"
							class="list-group-item list-group-item-action <?=$active[$no]?>">{{$no++}}.

							{{$project_item->name}}</a>

						@endforeach



					</div><!-- list-group -->

				</div>

			</div>

			<div class="col-lg-9">



				<div class="card bd-0 shadow-base ">

					<div class="d-md-flex justify-content-between pd-25">

						<div>

							<h5 class=" tx-uppercase tx-inverse tx-semibold tx-spacing-1">{{$project->name}}</h5>

							<p>{{$project->description}}</p>

						</div>

						<div class="d-sm-flex">



							<div>

								<p class="mg-b-5 tx-uppercase tx-10 tx-mont tx-semibold">PROJECT NUMBER</p>

								<h5 class="tx-lato tx-inverse tx-bold mg-b-0">{{$project->project_number}}</h5>

								{{-- <span class="tx-12 tx-success tx-roboto">2.7% increased</span> --}}

							</div>





							<div class="bd-sm-l pd-sm-l-20 mg-sm-l-20 mg-t-20 mg-sm-t-0">

								<p class="mg-b-5 tx-uppercase tx-10 tx-mont tx-semibold">CUSTOMER</p>



								<h5 class="tx-lato tx-inverse tx-bold mg-b-0">{{$project->customer['name']}}</h5>

								{{-- <span class="tx-12 tx-danger tx-roboto">4.65% decreased</span> --}}

							</div>



							<div class="bd-sm-l pd-sm-l-20 mg-sm-l-20 mg-t-20 mg-sm-t-0">

								<p class="mg-b-5 tx-uppercase tx-10 tx-mont tx-semibold">DATE CREATED</p>

								<h5 class="tx-lato tx-inverse tx-bold mg-b-0">

									{{ date('d F Y',strtotime($project->created_at)) }}</h5>

								<span
									class="tx-12 tx-success tx-roboto">{{ date('H:i:s',strtotime($project->created_at)) }}</span>

							</div>



							<div class="bd-sm-l pd-sm-l-20 mg-sm-l-20 mg-t-20 mg-sm-t-0">

								<p class="mg-b-5 tx-uppercase tx-10 tx-mont tx-semibold">Action</p>

								<button class="btn btn-success" data-toggle="modal" data-target="#modaldemo1"> <i
										class="icon ion-plus-round"></i> Add Items</button>

								<a href="{{url($base_route)}}"> <button class="btn btn-danger"> <i
											class="icon ion-ios-arrow-back"></i> Back</button>

								</a>

							</div>

						</div><!-- d-flex -->





					</div><!-- d-flex -->





				</div><!-- card -->



				<div class="card bd-0 shadow-base mg-t-20">



					<div class="pd-l-25 pd-r-15 pd-t-15 pd-b-25">

						@if(session()->has('create'))

						<div class="alert alert-success wd-100p">

							{{ session()->get('create') }}

							<button type="button" class="close" data-dismiss="alert" aria-label="Close">

								<span aria-hidden="true">&times;</span>

							</button>

						</div>

						@endif

						<div class="table-wrapper ">

							<table class="table respopnsive display  " id="datatable1">

								<thead>

									<th width="1%">No</th>

									<th width="">Description</th>

									<th width="8%">Type</th>

									<th width="8%">qty</th>

									<th width="8%">unit</th>

									<th width="8%">disc</th>

									<th width="">USER</th>

									<th width="">Created At</th>

									<th width="">price</th>

									<th width="">total cost</th>

									{{-- <th width="18%">Add By</th> --}}

									<th width="5%"> </th>

								</thead>

								<tbody>

									@php

									$no=1;

									@endphp

									@foreach ($project_items as $project_item)

									<tr>

										<td>{{$no++}}</td>

										<td>{{$project_item->description}}</td>

										<td>{{$project_item->type}}</td>

										<td>{{$project_item->qty}}</td>

										<td>{{$project_item->unit}}</td>

										<td>{{$project_item->disc}}</td>

										<td>{{$project_item->user['name']}}</td>

										<td>{{$project_item->created_at}}</td>

										<td>{{number_format($project_item->price,0,',','.')}}</td>

										<td>{{number_format($project_item->total_cost,0,',','.')}}</td>

										<td>

											<button class="btn btn-danger btn-sm  text-white"
												onclick="deleteItem({{$project_item->id}})">

												<i class="icon icon ion ion-ios-trash-outline"></i>

											</button>

										</td>

									</tr>

									@endforeach

								</tbody>

							</table>



						</div>

					</div>



				</div><!-- card -->









			</div>











		</div>

		<!-- BASIC MODAL -->

		<div id="modaldemo1" class="modal hide fade" data-keyboard="false" data-backdrop="static">

			<div class="modal-dialog modal-lg modal-dialog-centered" role="document">

				<div class="modal-content bd-0 tx-14">

					<div class="modal-header pd-y-20 pd-x-25">

						<h6 class="tx-14 mg-b-0 tx-uppercase tx-inverse tx-bold">Select Item :</h6>

						<button type="button" class="close" data-dismiss="modal" aria-label="Close">

							<span aria-hidden="true">&times;</span>

						</button>

					</div>

					<div class="modal-body pd-25">

						<div class="form-group">

							<label for="">Search Description :</label>

							<input type="text" value="" id="mySearch" placeholder="Search Description"
								class="form-control">

						</div>

						<div class="table-wrapper addItemWrapper">



							<table class="table " id="table-items" style="width: 100% !important;">

								<thead>

									<tr>

										<th width="1%">NO</th>

										<th>ID</th>
										<th>DESCRIPTION</th>

										<th width="1%">TYPE</th>

										<th width="1%">QTY</th>

										<th width="1%">-</th>

									</tr>

								</thead>

								<tbody></tbody>

								<tfoot>

									<tr>

										<th width="1%">NO</th>

										<th>ID</th>
										<th>DESCRIPTION</th>

										<th width="1%">TYPE</th>

										<th width="1%">QTY</th>

										<th width="1%">-</th>

									</tr>

								</tfoot>



							</table>

						</div>

					</div>

					<div class="modal-footer">

						<a href=""><button type="button"
								class="btn btn-primary tx-11 tx-uppercase pd-y-12 pd-x-25 tx-mont tx-medium">Done</button></a>

						<button type="button"
							class="btn btn-secondary tx-11 tx-uppercase pd-y-12 pd-x-25 tx-mont tx-medium"
							data-dismiss="modal">Close</button>

					</div>

				</div>

			</div><!-- modal-dialog -->

		</div>

		<!-- modal --

    </div>

  br-pagebody -->







		@include('layouts.partials.footer')

	</div><!-- br-mainpanel -->

	@endsection



	@push('scripts')

	<script>
		var route_url = '{{url($base_route)}}';



		$(document).ready(function () {

			var isSearch = false;



			$('.addItemWrapper').hide();

			var table = $('#table-items').DataTable({

				// responsive: true,

				dom: 'lrtip',

				language: {

					searchPlaceholder: 'Search...',

					sSearch: '',

					lengthMenu: '_MENU_ items/page',

				},

				language: {

					processing: '<div class="" style="position: relative;top: 41%;"><i class="fa fa-spinner fa-spin fa-3x fa-fw mg-t-20"></i><span class="sr-only">Loading...</span></div> '

				},

				// stateSave: true,

				searching: true,

				lengthChange: false,

				processing: true,

				serverSide: true,

				ajax: {

					url: route_url + '/json/{{$project->id}}',

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

						if (!isSearch) {



							location.reload();

						}

						console.log(err);

					},

				},

				columns: [



					{

						data: "DT_RowIndex",

						name: 'DT_RowIndex'

					},
					{

						data: 'id',

						name: 'id',





					},


					{

						data: 'description',





					},

					{

						data: 'type',

						name: 'type',





					},

					{

						data: 'id',

						render: function (data, type, row, meta) {

							return '<div style="display:flex">  <input type="number" value="1" min="0" id="qty-' +

								data + '"> </div>';

						}





					},

					{

						data: "id",



						render: function (data, type, row, meta) {

							return '<div style="display:flex">   <button class="btn btn-sm btn-info" onclick="addItem(' +

								data +

								',{{$project->id}})" > <i class="icon ion-plus"></i ></button> </div>';

						}

					},





				],

				"fnCreatedRow": function (nRow, data, iDataIndex) {

					$(nRow).attr('id', 'item-' + data['id']);

				}





			});



			$('#mySearch').keyup(function () {

				isSearch = !isSearch;

				$('.addItemWrapper').show();

				if ($(this).val() == '') {

					$('.addItemWrapper').hide();

				}

				table.search($(this).val()).draw();

			});



			function fn(text, count) {

				return text.slice(0, count) + (text.length > count ? "..." : "");

			}



			$('#table-items tfoot th').each(function () {

				var title = $(this).text();

				if (title == 'NO' || title == '-') {



				} else {

					$(this).html('<input type="text" class="form-control-sm" placeholder="Search ' +

						title + '" />');

				}

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



		function addItem(id, project_id) {

			var qty = $('#qty-' + id).val();

			if (qty < 0 || qty == '') {

				$.alert('Fill Qty !');

				return false;

			}

			$.ajax({

				type: 'GET',

				url: route_url + '/' + id + '/add-item/' + project_id + '/' + qty,

				// dataType: 'json',



				success: function (data) {



					if (data.duplicate) {

						$.toast({

							text: "Failed ! Item already exists !", // Text that is to be shown in the toast

							heading: 'Failed', // Optional heading to be shown on the toast

							icon: 'warning', // Type of toast icon

							showHideTransition: 'fade', // fade, slide or plain

							allowToastClose: true, // Boolean value true or false

							hideAfter: 3000, // false to make it sticky or number representing the miliseconds as time after which toast needs to be hidden

							stack: 5, // false if there should be only one toast at a time or a number representing the maximum number of toasts to be shown at a time

							position: 'top-right', // bottom-left or bottom-right or bottom-center or top-left or top-right or top-center or mid-center or an object representing the left, right, top, bottom values



							bgColor: '#FF1356',

							textColor: '#fff',





							textAlign: 'left', // Text alignment i.e. left, right or center

							loader: true, // Whether to show loader or not. True by default

							loaderBg: '#DC3545', // Background color of the toast loader

							beforeShow: function () {}, // will be triggered before the toast is shown

							afterShown: function () {}, // will be triggered after the toat has been shown

							beforeHide: function () {}, // will be triggered before the toast gets hidden

							afterHidden: function () {} // will be triggered after the toast has been hidden

						});

						// $.alert({

						//     title: ' ',

						//     theme: 'material',

						//     backgroundDismiss: true, // this will just close the modal



						//     content: 'Failed ! Item already exists !'



						// });

					} else {

						$.toast({

							text: "Item successfully added !", // Text that is to be shown in the toast

							heading: 'Success', // Optional heading to be shown on the toast

							icon: 'success', // Type of toast icon

							showHideTransition: 'fade', // fade, slide or plain

							allowToastClose: true, // Boolean value true or false

							hideAfter: 3000, // false to make it sticky or number representing the miliseconds as time after which toast needs to be hidden

							stack: 5, // false if there should be only one toast at a time or a number representing the maximum number of toasts to be shown at a time

							position: 'top-right', // bottom-left or bottom-right or bottom-center or top-left or top-right or top-center or mid-center or an object representing the left, right, top, bottom values





							bgColor: '#17A3B5',

							textColor: '#fff',

							textAlign: 'left', // Text alignment i.e. left, right or center

							loader: true, // Whether to show loader or not. True by default

							loaderBg: '#1C9A06', // Background color of the toast loader

							beforeShow: function () {}, // will be triggered before the toast is shown

							afterShown: function () {}, // will be triggered after the toat has been shown

							beforeHide: function () {}, // will be triggered before the toast gets hidden

							afterHidden: function () {} // will be triggered after the toast has been hidden



						});



						$('#mySearch').val('');

						$("#mySearch").focus()



						$('#item-' + id).animate({

							'line-height': 0

						}, 1000).remove();



						// $.alert({

						//     title: ' ',

						//     theme: 'material',

						//     backgroundDismiss: true, // this will just close the modal

						//     content: 'Item successfully added ! '

						// });

					}



				},

				error: function (data) {

					$.alert('Failed!');

					console.log(data);

				}

			});



		}

		$('#modaldemo1').modal({

			backdrop: 'static',

			keyboard: true,

			show: false

		});





		function deleteItem(id) {

			$.confirm({



				theme: 'material',

				title: 'Confirm!',

				content: 'Are you sure you want to delete data ?',

				buttons: {

					confirm: function () {

						$.ajax({

							type: 'DELETE',

							url: route_url + '/item/' + id,

							dataType: 'json',

							headers: {

								'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')

							},

							data: {

								"_token": "{{ csrf_token() }}"

							},

							success: function (data) {

								location.reload();

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

	</script>

	@if(session()->has('delete'))

	<script>
		$.toast({

			text: "{{ session()->get('delete') }}", // Text that is to be shown in the toast

			heading: 'Success ', // Optional heading to be shown on the toast

			icon: 'warning', // Type of toast icon

			showHideTransition: 'fade', // fade, slide or plain

			allowToastClose: true, // Boolean value true or false

			hideAfter: 3000, // false to make it sticky or number representing the miliseconds as time after which toast needs to be hidden

			stack: 5, // false if there should be only one toast at a time or a number representing the maximum number of toasts to be shown at a time

			position: 'top-right', // bottom-left or bottom-right or bottom-center or top-left or top-right or top-center or mid-center or an object representing the left, right, top, bottom values



			bgColor: '#FF1356',

			textColor: '#fff',





			textAlign: 'left', // Text alignment i.e. left, right or center

			loader: true, // Whether to show loader or not. True by default

			loaderBg: '#DC3545', // Background color of the toast loader

			beforeShow: function () {}, // will be triggered before the toast is shown

			afterShown: function () {}, // will be triggered after the toat has been shown

			beforeHide: function () {}, // will be triggered before the toast gets hidden

			afterHidden: function () {} // will be triggered after the toast has been hidden

		});

	</script>

	@endif



	@endpush
