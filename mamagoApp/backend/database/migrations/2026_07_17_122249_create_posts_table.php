<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('posts', function (Blueprint $table) {
            $table->id();
            $table->string('slug')->unique();
            $table->string('title');
            $table->string('category');
            $table->string('excerpt', 400);
            // Article body as markdown-ish paragraphs; the front renders
            // blank-line-separated blocks.
            $table->longText('body');
            $table->string('author');
            $table->string('author_role');
            $table->string('cover')->nullable();
            $table->unsignedSmallInteger('read_minutes')->default(4);
            $table->date('published_at');
            $table->boolean('is_featured')->default(false);
            $table->boolean('is_active')->default(true);
            $table->timestamps();

            $table->index(['is_active', 'published_at']);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('posts');
    }
};
