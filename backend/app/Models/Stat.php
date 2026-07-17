<?php

namespace App\Models;

use App\Models\Concerns\HasTranslations;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Model;

class Stat extends Model
{
    use HasTranslations;

    protected $fillable = [
        'key',
        'value',
        'label',
        'icon',
        'position',
    ];

    protected function casts(): array
    {
        // `value` stays plain: "+5M" and "24/7" read the same in both locales.
        return [
            'label' => 'array',
            'position' => 'integer',
        ];
    }

    public function scopeOrdered(Builder $query): Builder
    {
        return $query->orderBy('position');
    }
}
