<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class JobOfferResource extends JsonResource
{
    public function toArray(Request $request): array
    {
        return [
            'id' => $this->id,
            'slug' => $this->slug,
            'title' => $this->translate('title'),
            'department' => $this->translate('department'),
            'location' => $this->location,
            'contract' => $this->translate('contract'),
            'excerpt' => $this->translate('excerpt'),
            'mission' => $this->translate('mission'),
            'responsibilities' => $this->translate('responsibilities') ?? [],
            'requirements' => $this->translate('requirements') ?? [],
        ];
    }
}
