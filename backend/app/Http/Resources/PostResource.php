<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class PostResource extends JsonResource
{
    /**
     * The list view only needs the card fields; `body` is attached by the
     * detail endpoint via ->withBody().
     */
    private bool $withBody = false;

    public function withBody(): self
    {
        $this->withBody = true;

        return $this;
    }

    public function toArray(Request $request): array
    {
        return array_filter([
            'id' => $this->id,
            'slug' => $this->slug,
            'title' => $this->translate('title'),
            'category' => $this->translate('category'),
            'excerpt' => $this->translate('excerpt'),
            'author' => $this->author,
            'author_role' => $this->translate('author_role'),
            'cover' => $this->cover,
            'read_minutes' => $this->read_minutes,
            'published_at' => $this->published_at?->toDateString(),
            'is_featured' => $this->is_featured,
            'body' => $this->withBody ? $this->translate('body') : null,
        ], fn ($value) => $value !== null);
    }
}
