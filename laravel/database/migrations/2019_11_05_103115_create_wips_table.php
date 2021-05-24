<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateWipsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('wips', function (Blueprint $table) {
            $table->increments('id');
            $table->datetime('tstamp');
            $table->string('wip_number');
            $table->string('description')->nullable();
            $table->string('purchase_order_id');
            $table->string('request_by');
            $table->integer('approved_by');
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
        Schema::dropIfExists('wips');
    }
}
