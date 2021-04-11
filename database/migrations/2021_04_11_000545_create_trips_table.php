<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTripsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('trips', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('IDBus')->nullable();
            $table->foreign('IDBus')
                ->references('id')
                ->on('buses')
                ->onUpdate('cascade')
                ->onDelete('cascade');

            $table->unsignedBigInteger('startStation')->nullable();

            $table->foreign('startStation')
                ->references('id')
                ->on('stations')
                ->onUpdate('cascade')
                ->onDelete('cascade');

            $table->unsignedBigInteger('endStation')->nullable();

            $table->foreign('endStation')
                ->references('id')
                ->on('stations')
                ->onUpdate('cascade')
                ->onDelete('cascade');
            $table->dateTime('startDateTime');
            $table->dateTime('endDateTime');
            $table->enum('status',['ended','cancel','Preparation'])->default('Preparation');
            $table->float('cost')->default(0);
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
        Schema::dropIfExists('trips');
    }
}
