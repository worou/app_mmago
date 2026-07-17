<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Resources\CityResource;
use App\Http\Resources\CountryResource;
use App\Http\Resources\GuaranteeResource;
use App\Http\Resources\ServiceResource;
use App\Http\Resources\StatResource;
use App\Models\Country;
use App\Models\Guarantee;
use App\Models\Service;
use App\Models\Stat;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Resources\Json\AnonymousResourceCollection;

class ContentController extends Controller
{
    /**
     * Everything the landing page renders, in one round trip. The page needs
     * all four lists before it can paint, so splitting them into separate
     * requests would only add latency.
     */
    public function index(): JsonResponse
    {
        return response()->json([
            'data' => [
                'services' => ServiceResource::collection(Service::active()->ordered()->get()),
                'countries' => CountryResource::collection(Country::active()->ordered()->get()),
                'stats' => StatResource::collection(Stat::ordered()->get()),
                'guarantees' => GuaranteeResource::collection(Guarantee::ordered()->get()),
            ],
        ]);
    }

    public function services(): AnonymousResourceCollection
    {
        return ServiceResource::collection(Service::active()->ordered()->get());
    }

    public function countries(): AnonymousResourceCollection
    {
        return CountryResource::collection(Country::active()->ordered()->get());
    }

    /**
     * Country coverage with the cities live in each — backs the Pays page.
     * Excludes the "Et plus encore" tile, which has no cities.
     */
    public function coverage(): JsonResponse
    {
        $countries = Country::active()
            ->selectable()
            ->ordered()
            ->with('cities')
            ->get();

        return response()->json([
            'data' => $countries->map(fn (Country $country) => [
                'id' => $country->id,
                // translate(): name is a JSON locale map, not a plain string.
                'name' => $country->translate('name'),
                'code' => $country->code,
                'cities' => CityResource::collection($country->cities),
            ]),
        ]);
    }

    public function stats(): AnonymousResourceCollection
    {
        return StatResource::collection(Stat::ordered()->get());
    }

    public function guarantees(): AnonymousResourceCollection
    {
        return GuaranteeResource::collection(Guarantee::ordered()->get());
    }
}
