<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
 */

Route::get('/', function () {
    return redirect('/login');
    // return view('landing');
});

// Dashboard
Route::get('/dashboard', 'DashboardController@index')->name('dashboard');
Route::get('/users', 'DashboardController@index')->name('users');

Auth::routes();
Route::get('/home', 'HomeController@index')->name('home');
Route::get('/admin', 'AdminController@index');
Route::get('/superadmin', 'SuperAdminController@index');

// USER RESOURCE
Route::resource('/users', 'UserController');

// DEPARTEMENT RESOURCE
Route::resource('/departements', 'DepartementController');

// ITEM RESOURCE
Route::get('/items/json', 'ItemController@json')->name('items.json');
Route::resource('/items', 'ItemController');
Route::get('/download/{file}', 'ItemController@download');
Route::post('/impor/import_excel', 'ItemController@import_excel');
Route::get('/impor/test', 'ItemController@import_test');
Route::post('/items/{id}/update', 'ItemController@updateItem');
Route::post('/items/store', 'ItemController@storeItem');
Route::post('/items/delete-seleted', 'ItemController@destroySelectedItems');

// CUSTOMER RESOURCE
Route::resource('/customers', 'CustomerController');

// VENDOR RESOURCE
Route::resource('/vendors', 'VendorController');

// PROJECT RESOURCE
Route::get('/projects/{id}/add-item/{project_id}/{qty}', 'ProjectController@addItem')->name('projects.additem');
Route::get('/projects/json/{id_project}', 'ProjectController@json')->name('projects.json');
Route::delete('/projects/item/{id}', 'ProjectController@destroy_item')->name('projects.deleteitem');

Route::get('/projects/{id}/items', 'ProjectController@items');
Route::resource('/projects', 'ProjectController');

// PURCHASE REQUISITION RESOURCE
Route::get('/purchase-requisitions/{id}/create', 'PurchaseRequisitionController@create_pr');
Route::get('/purchase-requisitions/{id}/approve', 'PurchaseRequisitionController@approve');
Route::get('/purchase-requisitions/{id}/cancel', 'PurchaseRequisitionController@cancel');
Route::get('/purchase-requisitions/{id}/items', 'PurchaseRequisitionController@items');
Route::delete('/purchase-requisitions/{id}/item', 'PurchaseRequisitionController@destroyItem')->name('projects.deleteItem');
Route::post('/purchase-requisitions/{pr_id}/add-item', 'PurchaseRequisitionController@addItem');
Route::post('/purchase-requisitions/update-item', 'PurchaseRequisitionController@updateItem');

Route::resource('/purchase-requisitions', 'PurchaseRequisitionController');

// PURCHASE ORDER RESOURCE
Route::get('/purchase-orders/{id}/list', 'PurchaseOrderController@list');
Route::get('/purchase-orders/{id}/items', 'PurchaseOrderController@items');
Route::get('/purchase-orders/{id}/create/{pr}', 'PurchaseOrderController@create_po');
Route::post('/purchase-orders/{po_id}/add-item', 'PurchaseOrderController@addItem');
Route::post('/purchase-orders/update-item', 'PurchaseOrderController@updateItem');
Route::delete('/purchase-orders/{id}/item', 'PurchaseOrderController@destroyItem');

Route::post('/purchase-orders/update-po', 'PurchaseOrderController@updatePO');
Route::post('/purchase-orders/update-status', 'PurchaseOrderController@updateStatus');

Route::resource('/purchase-orders', 'PurchaseOrderController');

// WAREHOUSE SUMMARY
Route::resource('/warehouse/summary', 'WarehouseSummaryController');
Route::get('/warehouse/purchase-orders/{id}/items', 'WarehouseSummaryController@po');
Route::get('/warehouse/trending', 'WarehouseSummaryController@trending');
Route::post('/warehouse/purchase-orders/{id}/verified', 'WarehouseSummaryController@verified');

// WAREHOUSE ITEM
Route::get('/warehouse/items-in', 'WarehouseItemController@itemIn');
Route::get('/warehouse/items-out', 'WarehouseItemController@itemOut');
Route::resource('/warehouse/items', 'WarehouseItemController');
Route::resource('/warehouse/wip', 'WipController');
