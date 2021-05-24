<?php

use Illuminate\Database\Seeder;

class ItemsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {

        $items = [];
        $faker = Faker\Factory::create();
        for ($i = 0; $i < 20; $i++) {
            $stock = rand(0, 100);
            $disc = rand(0, 100);
            $price = rand(50000, 10000000);
            $total_cost = rand(50000, 10000000);
            $items[$i] = [
                'description' => $faker->word() . '-' . $i,
                'type' => 'D',
                'mfg' => 'D',
                'qty' => $stock,
                'unit' => 'Lot',
                'price' => $price,
                'disc' => $disc,
                'total_cost' => $total_cost,
                'created_at' => Carbon\Carbon::now(),
                'user_id' => 35,
            ];
        }
        DB::table('items')->insert($items);
    }
}
