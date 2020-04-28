<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMesgsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('mesgs', function (Blueprint $table) {
            $table->id();
            $table->mediumText('description');
            $table->integer('gtc_id');
            $table->integer('user_id');
            $table->integer('charge_affaire_id');
            $table->integer('num');
            $table->string('programme');
            $table->bigInteger('pce');
            $table->integer('nb_pce');
            $table->integer('nb_sg');
            $table->string('batiment');
            $table->string('commune');
            $table->string('adresse');
            $table->date('date_reception_mail');
            $table->date('date_reception_cm');
            $table->integer('delai');
            $table->date('date_souhaite');
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
        Schema::dropIfExists('mesgs');
    }
}
