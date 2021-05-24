<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProjectItems extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('project_items', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('item_id');
            $table->string('description');
            $table->string('type')->nullable();
            $table->string('mfg')->nullable();
            $table->string('qty')->nullable();
            $table->string('unit')->nullable();
            $table->integer('price');
            $table->integer('disc')->nullable();
            $table->integer('total_cost')->nullable();
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
        Schema::dropIfExists('project_items');
    }
}
