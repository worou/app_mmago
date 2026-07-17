<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\StoreLeadRequest;
use App\Models\Lead;
use Illuminate\Http\JsonResponse;
use Symfony\Component\HttpFoundation\Response;

class LeadController extends Controller
{
    public function store(StoreLeadRequest $request): JsonResponse
    {
        $lead = Lead::create($request->validated() + [
            'source' => $request->input('source', 'contact'),
        ]);

        return response()->json([
            'message' => __('messages.lead_received'),
            'data' => ['id' => $lead->id],
        ], Response::HTTP_CREATED);
    }
}
