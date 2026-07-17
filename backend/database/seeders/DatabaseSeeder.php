<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    use WithoutModelEvents;

    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        $this->call([
            // LandingSeeder first: PagesSeeder attaches cities to its countries.
            LandingSeeder::class,
            PagesSeeder::class,
        ]);
    }
}
