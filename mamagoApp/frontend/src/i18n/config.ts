// A string union, not an enum: `erasableSyntaxOnly` is on in this project.
export type Locale = 'fr' | 'en';

export const LOCALES: Locale[] = ['fr', 'en'];

export const DEFAULT_LOCALE: Locale = 'fr';

export const LOCALE_LABELS: Record<Locale, string> = {
  fr: 'Français',
  en: 'English',
};

/**
 * Localised path segments. French is the default and lives at the root; English
 * is served under /en, with its own segments so URLs read naturally in both.
 */
export const ROUTES = {
  home: { fr: '', en: '' },
  about: { fr: 'a-propos', en: 'about' },
  services: { fr: 'services', en: 'services' },
  countries: { fr: 'pays', en: 'countries' },
  careers: { fr: 'carrieres', en: 'careers' },
  blog: { fr: 'blog', en: 'blog' },
  contact: { fr: 'contact', en: 'contact' },
} as const;

export type RouteKey = keyof typeof ROUTES;

/** Build an absolute path for a route in a given locale, e.g. path('en','blog','my-post'). */
export function path(locale: Locale, key: RouteKey, param?: string): string {
  const prefix = locale === DEFAULT_LOCALE ? '' : `/${locale}`;
  const segment = ROUTES[key][locale];
  const parts = [prefix, segment, param].filter(Boolean).join('/');

  return parts.startsWith('/') ? parts : `/${parts}`;
}

/**
 * Same page, other locale — used by the language switcher so switching keeps
 * you where you are instead of dumping you on the home page.
 */
export function swapLocale(pathname: string, to: Locale): string {
  const stripped = pathname.replace(/^\/en(?=\/|$)/, '') || '/';
  const [, first = '', ...rest] = stripped.split('/');

  const from: Locale = pathname.startsWith('/en') ? 'en' : 'fr';
  const key = (Object.keys(ROUTES) as RouteKey[]).find(
    (routeKey) => ROUTES[routeKey][from] === first && first !== '',
  );

  return key ? path(to, key, rest.join('/') || undefined) : path(to, 'home');
}
