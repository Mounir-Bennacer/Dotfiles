<?php

use Illuminate\Database\Seeder;

use \App\Mesgs;

class MesgsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        factory(Mesgs::class, 350)->create();
    }
}
