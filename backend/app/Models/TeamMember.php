<?php

namespace App\Models;

use App\Models\Concerns\HasTranslations;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Model;

class TeamMember extends Model
{
    use HasTranslations;

    protected $fillable = [
        'name',
        'role',
        'bio',
        'photo',
        'position',
        'is_active',
    ];

    protected function casts(): array
    {
        // `name` stays plain: people's names are the same in both locales, and
        // the seeder matches on it.
        return [
            'role' => 'array',
            'bio' => 'array',
            'is_active' => 'boolean',
            'position' => 'integer',
        ];
    }

    public function scopeActive(Builder $query): Builder
    {
        return $query->where('is_active', true);
    }

    public function scopeOrdered(Builder $query): Builder
    {
        return $query->orderBy('position');
    }
}
