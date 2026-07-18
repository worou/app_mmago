<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Resources\StatResource;
use App\Http\Resources\TeamMemberResource;
use App\Http\Resources\ValueResource;
use App\Models\Stat;
use App\Models\TeamMember;
use App\Models\Value;
use Illuminate\Http\JsonResponse;

class AboutController extends Controller
{
    public function index(): JsonResponse
    {
        return response()->json([
            'data' => [
                'values' => ValueResource::collection(Value::ordered()->get()),
                'team' => TeamMemberResource::collection(TeamMember::active()->ordered()->get()),
                'stats' => StatResource::collection(Stat::ordered()->get()),
                'milestones' => $this->milestones(),
            ],
        ]);
    }

    /**
     * Company timeline. Static because it is narrative copy that changes once
     * a year, not data anyone administers — so it is translated through the
     * lang files rather than the database.
     *
     * @return list<array{year: string, title: string, text: string}>
     */
    private function milestones(): array
    {
        return collect(['2022', '2023', '2024', '2025', '2026'])
            ->map(fn (string $year) => [
                'year' => $year,
                'title' => __("about.milestones.$year.title"),
                'text' => __("about.milestones.$year.text"),
            ])
            ->all();
    }
}
