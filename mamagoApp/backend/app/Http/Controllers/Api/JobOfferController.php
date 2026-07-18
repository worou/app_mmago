<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Resources\JobOfferResource;
use App\Http\Resources\ValueResource;
use App\Models\JobOffer;
use App\Models\Value;
use Illuminate\Http\JsonResponse;

class JobOfferController extends Controller
{
    public function index(): JsonResponse
    {
        // department and title are JSON maps now, so order on the resolved
        // locale value in PHP rather than with a SQL orderBy.
        $offers = JobOffer::active()
            ->get()
            ->sortBy(fn (JobOffer $offer) => [$offer->translate('department'), $offer->translate('title')])
            ->values();

        return response()->json([
            'data' => JobOfferResource::collection($offers),
            'meta' => [
                'departments' => JobOffer::departmentsFor(),
                // The careers page reuses the company values as its culture pitch.
                'values' => ValueResource::collection(Value::ordered()->get()),
            ],
        ]);
    }

    public function show(JobOffer $jobOffer): JsonResponse
    {
        abort_unless($jobOffer->is_active, 404);

        return response()->json(['data' => new JobOfferResource($jobOffer)]);
    }
}
