<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Resources\PostResource;
use App\Models\Post;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;

class PostController extends Controller
{
    public function index(Request $request): JsonResponse
    {
        $posts = Post::active()->recent()->get();

        // Category is a JSON map now, so filter on the resolved locale value in
        // PHP rather than with a SQL where().
        if ($category = $request->query('category')) {
            $posts = $posts->filter(fn (Post $post) => $post->translate('category') === $category)->values();
        }

        return response()->json([
            'data' => PostResource::collection($posts),
            // Drives the category filter chips without a second request.
            'meta' => ['categories' => Post::categoriesFor()],
        ]);
    }

    public function show(Post $post): JsonResponse
    {
        abort_unless($post->is_active, 404);

        $related = Post::active()
            ->recent()
            ->where('id', '!=', $post->id)
            ->get()
            ->filter(fn (Post $other) => $other->translate('category') === $post->translate('category'))
            ->take(2)
            ->values();

        return response()->json([
            'data' => (new PostResource($post))->withBody(),
            'related' => PostResource::collection($related),
        ]);
    }
}
