<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

/**
 * Careers listings. Named `job_offers` because `jobs` is already taken by
 * Laravel's queue table.
 */
return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('job_offers', function (Blueprint $table) {
            $table->id();
            $table->string('slug')->unique();
            $table->string('title');
            $table->string('department');
            $table->string('location');
            $table->string('contract');
            $table->string('excerpt', 400);
            $table->text('mission');
            $table->json('responsibilities');
            $table->json('requirements');
            $table->boolean('is_active')->default(true);
            $table->timestamps();

            $table->index(['is_active', 'department']);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('job_offers');
    }
};
