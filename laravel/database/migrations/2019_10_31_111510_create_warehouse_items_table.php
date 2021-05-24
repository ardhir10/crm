<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateWarehouseItemsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('warehouse_items', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('item_id');
            $table->string('description');
            $table->string('type')->nullable();
            $table->string('mfg')->nullable();
            $table->string('qty')->nullable();
            $table->string('unit')->nullable();
            $table->integer('price');
            $table->integer('disc')->nullable();
            $table->integer('net_price')->nullable();
            $table->integer('total_cost')->nullable();
            $table->string('vendor')->nullable();
            $table->unsignedBigInteger('purchase_order_id');
            $table->integer('status');
            $table->integer('created_by')->nullable();
            $table->timestamps();

        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('warehouse_items');
    }
}
