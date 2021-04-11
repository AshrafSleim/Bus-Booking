<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTripStationsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('trip_stations', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('IDTrip');
            $table->foreign('IDTrip')
                ->references('id')
                ->on('trips')
                ->onUpdate('cascade')
                ->onDelete('cascade');

            $table->unsignedBigInteger('IDStation');
            $table->foreign('IDStation')
                ->references('id')
                ->on('stations')
                ->onUpdate('cascade')
                ->onDelete('cascade');
            $table->integer('StationOrder');
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
        Schema::dropIfExists('trip_stations');
    }
}
