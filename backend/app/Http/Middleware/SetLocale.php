<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

/**
 * Resolves the request locale from ?locale=, then Accept-Language, and applies
 * it to the app so translated resources and validation messages line up.
 */
class SetLocale
{
    public const SUPPORTED = ['fr', 'en'];

    public function handle(Request $request, Closure $next): Response
    {
        $locale = $request->query('locale')
            ?? $request->getPreferredLanguage(self::SUPPORTED);

        if (in_array($locale, self::SUPPORTED, true)) {
            app()->setLocale($locale);
        }

        return $next($request);
    }
}
