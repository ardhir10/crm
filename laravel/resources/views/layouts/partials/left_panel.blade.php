<div class="br-logo"><a href="#"><span>[</span>Jakarta <i>Process</i><span>]</span></a></div>
    <div class="br-sideleft sideleft-scrollbar">
        <label class="sidebar-label pd-x-10 mg-t-20 op-3">Navigation</label>
        <ul class="br-sideleft-menu">
            <li class="br-menu-item">
                <a href="{{url('dashboard')}}" class="br-menu-link ">
                    <i class="menu-item-icon icon ion-ios-home-outline tx-24"></i>
                    <span class="menu-item-label">Dashboard</span>
                </a><!-- br-menu-link -->
            </li><!-- br-menu-item -->
            
            <li class="br-menu-item">
                <a href="{{url('projects')}}" class="br-menu-link ">
                    <i class="menu-item-icon icon ion-settings tx-24"></i>
                    <span class="menu-item-label">Projects </span>
                </a><!-- br-menu-link -->
            </li><!-- br-menu-item -->

            <li class="br-menu-item">
                <a href="{{url('purchase-requisitions')}}" class="br-menu-link ">
                    <i class="menu-item-icon icon ion-clipboard tx-24"></i>
                    <span class="menu-item-label">Purchase Requisition </span>
                </a><!-- br-menu-link -->
            </li><!-- br-menu-item -->

            <li class="br-menu-item">
                <a href="{{url('purchase-orders')}}" class="br-menu-link ">
                    <i class="menu-item-icon icon ion-bag tx-24"></i>
                    <span class="menu-item-label">Purchase Order </span>
                </a><!-- br-menu-link -->
            </li><!-- br-menu-item -->

            

           

            <li class="br-menu-item">
                <a href="#" class="br-menu-link with-sub">
                    <i class="menu-item-icon icon ion-home tx-20"></i>
                    <span class="menu-item-label">Warehouse</span>
                </a><!-- br-menu-link -->
                <ul class="br-menu-sub">
                    <li class="sub-item"><a href="{{url('warehouse/summary')}}" class="sub-link">Summary</a></li>
                    <li class="sub-item"><a href="{{url('warehouse/items')}}" class="sub-link">All Items</a></li>
                    <li class="sub-item"><a href="{{url('warehouse/items-in')}}" class="sub-link">Items In</a></li>
                    <li class="sub-item"><a href="{{url('warehouse/items-out')}}" class="sub-link">Items Out</a></li>
                    {{-- <li class="sub-item"><a href="{{url('warehouse/wip')}}" class="sub-link">Work In Process</a></li> --}}
                </ul>
            </li>
           
            <li class="br-menu-item">
                <a href="#" class="br-menu-link with-sub">
                    <i class="menu-item-icon icon ion-folder tx-20"></i>
                    <span class="menu-item-label">Master Data</span>
                </a><!-- br-menu-link -->
                <ul class="br-menu-sub">
                    <li class="sub-item"><a href="{{url('customers')}}" class="sub-link">Customers</a></li>
                    <li class="sub-item"><a href="{{url('departements')}}" class="sub-link">Departements</a></li>
                    <li class="sub-item"><a href="{{url('items')}}" class="sub-link">Items</a></li>
                    {{-- <li class="sub-item"><a href="{{url('projects')}}" class="sub-link">Projects</a></li> --}}
                    <li class="sub-item"><a href="{{url('users')}}" class="sub-link">Users</a></li>
                    <li class="sub-item"><a href="{{url('vendors')}}" class="sub-link">Vendors</a></li>
                </ul>
            </li>
            
        </ul><!-- br-sideleft-menu -->

        <label class="sidebar-label pd-x-10 mg-t-25 mg-b-20 tx-info">Information Summary</label>

         
        <br>
    </div><!-- br-sideleft -->