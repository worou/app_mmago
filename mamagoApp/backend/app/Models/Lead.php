<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Lead extends Model
{
    protected $fillable = [
        'name',
        'email',
        'phone',
        'country_id',
        'message',
        'source',
    ];

    public function country(): BelongsTo
    {
        return $this->belongsTo(Country::class);
    }
}
