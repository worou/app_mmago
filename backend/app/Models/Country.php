<?php

namespace App\Models;

use App\Models\Concerns\HasTranslations;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Country extends Model
{
    use HasTranslations;

    protected $fillable = [
        'key',
        'name',
        'code',
        'is_placeholder',
        'position',
        'is_active',
    ];

    protected function casts(): array
    {
        return [
            'name' => 'array',
            'is_placeholder' => 'boolean',
            'is_active' => 'boolean',
            'position' => 'integer',
        ];
    }

    public function leads(): HasMany
    {
        return $this->hasMany(Lead::class);
    }

    public function cities(): HasMany
    {
        return $this->hasMany(City::class)->orderBy('position');
    }

    public function scopeActive(Builder $query): Builder
    {
        return $query->where('is_active', true);
    }

    public function scopeOrdered(Builder $query): Builder
    {
        return $query->orderBy('position');
    }

    /**
     * Real countries only — excludes the "Et plus encore" tile, so this can
     * back the contact form's country picker.
     */
    public function scopeSelectable(Builder $query): Builder
    {
        return $query->where('is_placeholder', false);
    }
}
