<?php

namespace App\Models\Concerns;

/**
 * Field-level translations stored as {"fr": …, "en": …} in a JSON column.
 *
 * Rows keep stable ids, so foreign keys (leads.country_id, cities.country_id)
 * stay valid — which duplicating rows per locale would have broken.
 *
 * Resolution happens in PHP, never in SQL: this runs on MariaDB, where `json`
 * is really `longtext` and the JSON functions differ from MySQL's.
 */
trait HasTranslations
{
    /**
     * Value of $field in the active locale, falling back to the app fallback
     * locale and then to whatever translation exists.
     */
    public function translate(string $field): mixed
    {
        $value = $this->getAttribute($field);

        if (! is_array($value)) {
            return $value;
        }

        $locale = app()->getLocale();

        if (array_key_exists($locale, $value)) {
            return $value[$locale];
        }

        $fallback = config('app.fallback_locale');

        if (array_key_exists($fallback, $value)) {
            return $value[$fallback];
        }

        return reset($value) ?: null;
    }
}
