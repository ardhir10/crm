 <div class="pd-10">
     <table class="table display responsive  datatable2 table-bordered" id="table-items">
         <thead class="thead-dark">
             <th width="2%">No</th>
             <th>Action</th>
             <th>Description</th>
         </thead>
         <tbody>
             {{-- @php
             $no = 1;
             @endphp
             @foreach ($items as $item)
             <tr>
                 <td>{{$no++}}</td>
                 <td>
                     <button class="btn btn-sm btn-info"> <i class="icon ion-plus"></i></button>
                 </td>
                 <td>{{$item->description}}</td>
             </tr>
             @endforeach --}}




         </tbody>
     </table>
 </div>
 <script>

     $(function () {

         var table = $('#table-items').DataTable({
             responsive: true,
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
                 url: '{{url("/")}}/projects/json',
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
                     data: 'description',

                     render: function (data, type, full, meta) {
                         return fn(data, 10);
                     },
                 },
                 {
                     data: 'description',

                     render: function (data, type, full, meta) {
                         return fn(data, 10);
                     },
                 },
                 
                
             ],


         });

        //  function fn(text, count) {
        //      return text.slice(0, count) + (text.length > count ? "..." : "");
        //  }

        //  $('#table tfoot th').each(function () {
        //      var title = $(this).text();
        //      if (title != 'NO')
        //          $(this).html('<input type="text" class="form-control-sm" placeholder="Search ' +
        //              title + '" />');
        //  });



        //  // Apply the search
        //  table.columns().every(function () {
        //      var that = this;

        //      $('input', this.footer()).on('keyup change clear', function () {
        //          if (that.search() !== this.value) {
        //              that
        //                  .search(this.value)
        //                  .draw();
        //          }
        //      });
        //  });
     });

 </script>
