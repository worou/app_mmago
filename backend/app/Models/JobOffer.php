<?php

namespace App\Models;

use App\Models\Concerns\HasTranslations;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Model;

class JobOffer extends Model
{
    use HasTranslations;

    protected $fillable = [
        'slug',
        'title',
        'department',
        'location',
        'contract',
        'excerpt',
        'mission',
        'responsibilities',
        'requirements',
        'is_active',
    ];

    protected function casts(): array
    {
        // `location` stays plain: city names read the same in both locales.
        // `responsibilities` / `requirements` are a locale map of string lists.
        return [
            'title' => 'array',
            'department' => 'array',
            'contract' => 'array',
            'excerpt' => 'array',
            'mission' => 'array',
            'responsibilities' => 'array',
            'requirements' => 'array',
            'is_active' => 'boolean',
        ];
    }

    public function getRouteKeyName(): string
    {
        return 'slug';
    }

    public function scopeActive(Builder $query): Builder
    {
        return $query->where('is_active', true);
    }

    /**
     * Distinct departments in the active locale. Resolved in PHP: the column is
     * a JSON map now, so SQL DISTINCT would compare raw maps.
     */
    public static function departmentsFor(): array
    {
        return static::active()
            ->get()
            ->map(fn (self $offer) => $offer->translate('department'))
            ->unique()
            ->sort()
            ->values()
            ->all();
    }
}
