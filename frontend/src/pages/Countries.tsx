import { fetchContent, fetchCoverage } from '../api/client';
import { Flag } from '../components/Flag';
import { useLayout } from '../components/Layout';
import { PageHeader } from '../components/PageHeader';
import { PageState } from '../components/PageState';
import { useApi } from '../hooks/useApi';
import { useLocale } from '../i18n/LocaleContext';
import type { CoverageCountry, LandingContent } from '../types';

export function Countries() {
  const { locale, t } = useLocale();
  const coverage = useApi<CoverageCountry[]>(() => fetchCoverage(locale), `coverage:${locale}`);
  const content = useApi<LandingContent>(() => fetchContent(locale), `content:${locale}`);
  const { openDownload } = useLayout();

  const loading = coverage.loading || content.loading;
  const error = coverage.error ?? content.error;

  if (loading || error || !coverage.data || !content.data) {
    return <PageState loading={loading} error={error} />;
  }

  // Map service slugs to their display titles so the city chips read like the
  // rest of the site rather than exposing slugs.
  const titles = new Map(content.data.services.map((service) => [service.slug, service.title]));
  const cityCount = coverage.data.reduce((total, country) => total + country.cities.length, 0);

  return (
    <>
      <PageHeader
        eyebrow={t.countries.eyebrow}
        title={
          <>
            {t.countries.titleLine1}
            <br />
            <span className="phead__title-accent">{t.countries.titleLine2}</span>
          </>
        }
        lead={t.countries.lead(coverage.data.length, cityCount)}
      />

      <section className="section">
        <div className="container">
          <ul className="cgrid">
            {coverage.data.map((country) => (
              <li className="ccard" key={country.id}>
                <header className="ccard__head">
                  <Flag code={country.code} name={country.name} size={44} />
                  <div>
                    <h2 className="ccard__name">{country.name}</h2>
                    <p className="ccard__count">
                      {country.cities.length}{' '}
                      {country.cities.length > 1 ? t.countries.cities : t.countries.city}
                    </p>
                  </div>
                </header>

                <ul className="ccard__cities">
                  {country.cities.map((city) => (
                    <li className="city" key={city.id}>
                      <div className="city__head">
                        <span className="city__name">{city.name}</span>
                        {city.is_capital && (
                          <span className="city__badge">{t.countries.capital}</span>
                        )}
                      </div>
                      <div className="city__services">
                        {city.services.map((slug) => (
                          <span className="city__chip" key={slug}>
                            {titles.get(slug) ?? slug}
                          </span>
                        ))}
                      </div>
                    </li>
                  ))}
                </ul>
              </li>
            ))}
          </ul>
        </div>
      </section>

      <section className="cta">
        <div className="container cta__inner">
          <div>
            <h2 className="cta__title">{t.countries.ctaTitle}</h2>
            <p className="cta__text">{t.countries.ctaText}</p>
          </div>
          <div className="cta__actions">
            <button type="button" className="btn btn--primary btn--lg" onClick={openDownload}>
              {t.countries.ctaButton}
            </button>
          </div>
        </div>
      </section>
    </>
  );
}
