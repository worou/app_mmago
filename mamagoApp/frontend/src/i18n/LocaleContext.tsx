import { createContext, useContext, useEffect, useMemo, type ReactNode } from 'react';
import type { Locale, RouteKey } from './config';
import { path } from './config';
import { STRINGS, type Strings } from './strings';

interface LocaleValue {
  locale: Locale;
  /** UI strings for the active locale. */
  t: Strings;
  /** Build a path in the active locale: to('blog', slug). */
  to: (key: RouteKey, param?: string) => string;
}

const LocaleContext = createContext<LocaleValue | null>(null);

export function useLocale(): LocaleValue {
  const value = useContext(LocaleContext);

  if (!value) {
    throw new Error('useLocale must be used inside <LocaleProvider>');
  }

  return value;
}

export function LocaleProvider({ locale, children }: { locale: Locale; children: ReactNode }) {
  // Keep the document language, title and meta description in sync — they drive
  // screen-reader pronunciation, the browser tab, bookmarks and share previews,
  // none of which a body-only screenshot would reveal as stale.
  useEffect(() => {
    document.documentElement.lang = locale;
    document.title = STRINGS[locale].meta.title;
    document
      .querySelector('meta[name="description"]')
      ?.setAttribute('content', STRINGS[locale].meta.description);
  }, [locale]);

  const value = useMemo<LocaleValue>(
    () => ({
      locale,
      t: STRINGS[locale],
      to: (key: RouteKey, param?: string) => path(locale, key, param),
    }),
    [locale],
  );

  return <LocaleContext.Provider value={value}>{children}</LocaleContext.Provider>;
}
