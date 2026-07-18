<?php

namespace App\Models;

use App\Models\Concerns\HasTranslations;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Model;

class Post extends Model
{
    use HasTranslations;

    protected $fillable = [
        'slug',
        'title',
        'category',
        'excerpt',
        'body',
        'author',
        'author_role',
        'cover',
        'read_minutes',
        'published_at',
        'is_featured',
        'is_active',
    ];

    protected function casts(): array
    {
        return [
            'title' => 'array',
            'category' => 'array',
            'excerpt' => 'array',
            'body' => 'array',
            'author_role' => 'array',
            'published_at' => 'date',
            'is_featured' => 'boolean',
            'is_active' => 'boolean',
            'read_minutes' => 'integer',
        ];
    }

    /**
     * Distinct categories in the active locale. Resolved in PHP rather than
     * with a SQL DISTINCT, since the column is now a JSON map.
     */
    public static function categoriesFor(): array
    {
        return static::active()
            ->get()
            ->map(fn (self $post) => $post->translate('category'))
            ->unique()
            ->sort()
            ->values()
            ->all();
    }

    /** Resolve route-model bindings by slug rather than id. */
    public function getRouteKeyName(): string
    {
        return 'slug';
    }

    public function scopeActive(Builder $query): Builder
    {
        return $query->where('is_active', true);
    }

    public function scopeRecent(Builder $query): Builder
    {
        return $query->orderByDesc('published_at');
    }
}
