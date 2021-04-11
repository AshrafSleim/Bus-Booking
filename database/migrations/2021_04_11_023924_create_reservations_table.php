<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateReservationsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('reservations', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('IDTrip');
            $table->foreign('IDTrip')
                ->references('id')
                ->on('trips')
                ->onUpdate('cascade')
                ->onDelete('cascade');

            $table->integer('seatNumber');
            $table->integer('startStationOrder');
            $table->integer('endStationOrder');
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
        Schema::dropIfExists('reservations');
    }
}
