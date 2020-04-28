<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateChargeAffairesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('charge_affaires', function (Blueprint $table) {
            $table->id();
            $table->integer('mesg_id');
            $table->integer('centre_id');
            $table->string('nom');
            $table->string('prenom');
            $table->integer('telephone_fixe');
            $table->integer('telephone_portable');
            $table->integer('email')->unique();
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
        Schema::dropIfExists('charge_affaires');
    }
}
