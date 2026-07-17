<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class City extends Model
{
    protected $fillable = [
        'country_id',
        'name',
        'is_capital',
        'services',
        'position',
    ];

    protected function casts(): array
    {
        return [
            'services' => 'array',
            'is_capital' => 'boolean',
            'position' => 'integer',
        ];
    }

    public function country(): BelongsTo
    {
        return $this->belongsTo(Country::class);
    }

    public function scopeOrdered(Builder $query): Builder
    {
        return $query->orderBy('position');
    }
}
