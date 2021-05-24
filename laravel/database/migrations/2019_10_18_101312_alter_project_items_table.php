<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AlterProjectItemsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('project_items', function (Blueprint $table) {
            $table->unsignedBigInteger('project_id');

            // $table->foreign('user_id')->references('id')->on('users');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        if (Schema::hasColumn('project_items', 'project_id')) {

            Schema::table('project_items', function (Blueprint $table) {
                $table->dropForeign(['project_id']);
            });
        }
    }
}
