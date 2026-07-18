import { useCallback, useEffect, useState } from 'react';
import { Outlet, useLocation, useOutletContext } from 'react-router-dom';
import { fetchContent } from '../api/client';
import type { Locale } from '../i18n/config';
import { LocaleProvider } from '../i18n/LocaleContext';
import type { Country } from '../types';
import { Footer } from './Footer';
import { LeadModal } from './LeadModal';
import { Navbar } from './Navbar';

interface LayoutContext {
  openDownload: () => void;
}

/** Pages reach the shared download modal through the outlet context. */
export function useLayout(): LayoutContext {
  return useOutletContext<LayoutContext>();
}

export function Layout({ locale }: { locale: Locale }) {
  return (
    <LocaleProvider locale={locale}>
      <Shell locale={locale} />
    </LocaleProvider>
  );
}

/** Inside the provider, so children can use the locale hooks. */
function Shell({ locale }: { locale: Locale }) {
  const [countries, setCountries] = useState<Country[]>([]);
  const [modalOpen, setModalOpen] = useState(false);
  const { pathname } = useLocation();

  // The modal's country picker is needed from every page, so it is fetched
  // once here rather than by each route. Refetched on locale change so the
  // picker follows the language. A failure leaves it empty — the form still
  // submits, since country is optional.
  useEffect(() => {
    let cancelled = false;
    fetchContent(locale)
      .then((content) => {
        if (!cancelled) setCountries(content.countries);
      })
      .catch(() => undefined);
    return () => {
      cancelled = true;
    };
  }, [locale]);

  // Client-side navigation keeps the scroll position; reset it per route.
  useEffect(() => {
    window.scrollTo(0, 0);
  }, [pathname]);

  const openDownload = useCallback(() => setModalOpen(true), []);

  return (
    <>
      <Navbar onDownload={openDownload} />
      <main>
        <Outlet context={{ openDownload } satisfies LayoutContext} />
      </main>
      <Footer />
      <LeadModal open={modalOpen} countries={countries} onClose={() => setModalOpen(false)} />
    </>
  );
}
