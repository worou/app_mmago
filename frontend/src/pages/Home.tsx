import { useNavigate } from 'react-router-dom';
import { fetchContent } from '../api/client';
import { CountriesBand } from '../components/CountriesBand';
import { Guarantees } from '../components/Guarantees';
import { Hero } from '../components/Hero';
import { useLayout } from '../components/Layout';
import { PageState } from '../components/PageState';
import { Services } from '../components/Services';
import { useApi } from '../hooks/useApi';
import { useLocale } from '../i18n/LocaleContext';
import type { LandingContent } from '../types';

export function Home() {
  const { locale, to } = useLocale();
  // The locale is part of the key: switching language must refetch.
  const { data, error, loading } = useApi<LandingContent>(
    () => fetchContent(locale),
    `content:${locale}`,
  );
  const { openDownload } = useLayout();
  const navigate = useNavigate();

  if (loading || error || !data) {
    return <PageState loading={loading} error={error} />;
  }

  return (
    <>
      <Hero
        stats={data.stats}
        onDiscover={() => navigate(to('services'))}
        onDownload={openDownload}
      />
      <Services services={data.services} />
      <CountriesBand countries={data.countries} />
      <Guarantees guarantees={data.guarantees} />
    </>
  );
}
