<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

/**
 * Make the editorial post fields translatable: {"fr": …, "en": …}.
 *
 * `slug` stays a plain column so route-model binding remains an ordinary
 * where() — no JSON predicates, which matters on MariaDB.
 */
return new class extends Migration
{
    private const FIELDS = ['title', 'category', 'excerpt', 'body', 'author_role'];

    public function up(): void
    {
        // Wrap existing French values before widening the column, so no content
        // is lost if this runs on a populated database.
        foreach (DB::table('posts')->get(['id', ...self::FIELDS]) as $post) {
            DB::table('posts')->where('id', $post->id)->update(
                collect(self::FIELDS)
                    ->mapWithKeys(fn (string $field) => [
                        $field => json_encode(['fr' => $post->{$field}], JSON_UNESCAPED_UNICODE),
                    ])
                    ->all(),
            );
        }

        Schema::table('posts', function (Blueprint $table) {
            $table->json('title')->change();
            $table->json('category')->change();
            $table->json('excerpt')->change();
            $table->json('body')->change();
            $table->json('author_role')->change();
        });
    }

    public function down(): void
    {
        Schema::table('posts', function (Blueprint $table) {
            $table->string('title')->change();
            $table->string('category')->change();
            $table->string('excerpt', 400)->change();
            $table->longText('body')->change();
            $table->string('author_role')->change();
        });

        foreach (DB::table('posts')->get(['id', ...self::FIELDS]) as $post) {
            DB::table('posts')->where('id', $post->id)->update(
                collect(self::FIELDS)
                    ->mapWithKeys(function (string $field) use ($post) {
                        $decoded = json_decode((string) $post->{$field}, true);

                        return [$field => is_array($decoded) ? ($decoded['fr'] ?? '') : $post->{$field}];
                    })
                    ->all(),
            );
        }
    }
};
