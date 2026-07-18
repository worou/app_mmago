<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Str;

/**
 * Makes the rest of the editorial content translatable: {"fr": …, "en": …}.
 *
 * Three tables (`countries`, `guarantees`, `values`) are seeded by matching on a
 * column that becomes a JSON map here. They get a language-neutral `key` first,
 * so `updateOrCreate` keeps matching instead of silently inserting duplicates.
 *
 * Not translated on purpose: city and person names (identical in both locales),
 * `stats.value` and `job_offers.location` — figures and place names.
 *
 * Every step is guarded, because DDL auto-commits on MySQL: a migration that
 * fails halfway leaves the schema partly changed and has to be safe to re-run.
 */
return new class extends Migration
{
    /** Plain text columns to widen, keyed by table. */
    private const TRANSLATABLE = [
        'services' => ['title', 'description'],
        'countries' => ['name'],
        'stats' => ['label'],
        'guarantees' => ['title', 'subtitle'],
        'values' => ['title', 'description'],
        'team_members' => ['role', 'bio'],
        'job_offers' => ['title', 'department', 'contract', 'excerpt', 'mission'],
    ];

    public function up(): void
    {
        $this->addNaturalKeys();
        $this->dropBlockingIndex();
        // Widen first: wrapping a value into {"fr": …} makes it longer, which a
        // narrow varchar would reject.
        $this->widenColumns();
        $this->wrapExistingValues();
    }

    private function addNaturalKeys(): void
    {
        foreach (['countries' => 'name', 'guarantees' => 'title', 'values' => 'title'] as $table => $source) {
            if (! Schema::hasColumn($table, 'key')) {
                Schema::table($table, function (Blueprint $blueprint) {
                    $blueprint->string('key')->nullable()->after('id');
                });
            }

            // Derive keys from the current French values so existing rows keep
            // their identity across the reseed.
            foreach (DB::table($table)->whereNull('key')->get(['id', $source]) as $row) {
                $value = $this->unwrap($row->{$source});

                DB::table($table)->where('id', $row->id)->update([
                    'key' => Str::slug((string) $value) ?: 'row-'.$row->id,
                ]);
            }
        }
    }

    /**
     * `department` is indexed, and a JSON/longtext column cannot carry an index
     * without a prefix length. The index is obsolete anyway: department is
     * filtered in PHP now that it is a locale map.
     */
    private function dropBlockingIndex(): void
    {
        $exists = collect(DB::select('SHOW INDEX FROM job_offers'))
            ->contains(fn ($index) => $index->Key_name === 'job_offers_is_active_department_index');

        if ($exists) {
            Schema::table('job_offers', function (Blueprint $table) {
                $table->dropIndex('job_offers_is_active_department_index');
            });
        }

        if (! collect(DB::select('SHOW INDEX FROM job_offers'))->contains(fn ($i) => $i->Key_name === 'job_offers_is_active_index')) {
            Schema::table('job_offers', function (Blueprint $table) {
                $table->index('is_active');
            });
        }
    }

    private function widenColumns(): void
    {
        foreach (self::TRANSLATABLE as $table => $fields) {
            foreach ($fields as $field) {
                if (Schema::getColumnType($table, $field) === 'longtext') {
                    continue;
                }

                Schema::table($table, function (Blueprint $blueprint) use ($field) {
                    $blueprint->json($field)->change();
                });
            }
        }
    }

    private function wrapExistingValues(): void
    {
        foreach (self::TRANSLATABLE as $table => $fields) {
            foreach (DB::table($table)->get(['id', ...$fields]) as $row) {
                $updates = [];

                foreach ($fields as $field) {
                    if ($this->isWrapped($row->{$field})) {
                        continue;
                    }

                    $updates[$field] = json_encode(['fr' => $row->{$field}], JSON_UNESCAPED_UNICODE);
                }

                if ($updates !== []) {
                    DB::table($table)->where('id', $row->id)->update($updates);
                }
            }
        }

        // Already JSON arrays — wrap the array itself under the locale key.
        foreach (DB::table('job_offers')->get(['id', 'responsibilities', 'requirements']) as $offer) {
            $updates = [];

            foreach (['responsibilities', 'requirements'] as $field) {
                $decoded = json_decode((string) $offer->{$field}, true);

                // A list is unwrapped; a map keyed by locale is already done.
                if (! is_array($decoded) || ! array_is_list($decoded)) {
                    continue;
                }

                $updates[$field] = json_encode(['fr' => $decoded], JSON_UNESCAPED_UNICODE);
            }

            if ($updates !== []) {
                DB::table('job_offers')->where('id', $offer->id)->update($updates);
            }
        }
    }

    private function isWrapped(mixed $value): bool
    {
        if (! is_string($value)) {
            return false;
        }

        $decoded = json_decode($value, true);

        return is_array($decoded) && (isset($decoded['fr']) || isset($decoded['en']));
    }

    private function unwrap(mixed $value): mixed
    {
        if (! is_string($value)) {
            return $value;
        }

        $decoded = json_decode($value, true);

        return is_array($decoded) ? ($decoded['fr'] ?? reset($decoded)) : $value;
    }

    public function down(): void
    {
        Schema::table('services', function (Blueprint $table) {
            $table->string('title')->change();
            $table->text('description')->change();
        });
        Schema::table('countries', function (Blueprint $table) {
            $table->string('name')->change();
            $table->dropColumn('key');
        });
        Schema::table('stats', function (Blueprint $table) {
            $table->string('label')->change();
        });
        Schema::table('guarantees', function (Blueprint $table) {
            $table->string('title')->change();
            $table->string('subtitle')->change();
            $table->dropColumn('key');
        });
        Schema::table('values', function (Blueprint $table) {
            $table->string('title')->change();
            $table->string('description', 400)->change();
            $table->dropColumn('key');
        });
        Schema::table('team_members', function (Blueprint $table) {
            $table->string('role')->change();
            $table->string('bio', 400)->change();
        });
        Schema::table('job_offers', function (Blueprint $table) {
            $table->string('title')->change();
            $table->string('department')->change();
            $table->string('contract')->change();
            $table->string('excerpt', 400)->change();
            $table->text('mission')->change();
        });
    }
};
