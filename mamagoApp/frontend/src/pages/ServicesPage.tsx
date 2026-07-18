import { fetchContent } from '../api/client';
import { Guarantees } from '../components/Guarantees';
import { useLayout } from '../components/Layout';
import { PageHeader } from '../components/PageHeader';
import { PageState } from '../components/PageState';
import { ServiceIcon } from '../components/ServiceIcon';
import { UiIcon } from '../components/UiIcon';
import { useApi } from '../hooks/useApi';
import { useLocale } from '../i18n/LocaleContext';
import { contentImage } from '../lib/images';
import type { LandingContent } from '../types';

export function ServicesPage() {
  const { locale, t } = useLocale();
  const { data, error, loading } = useApi<LandingContent>(
    () => fetchContent(locale),
    `content:${locale}`,
  );
  const { openDownload } = useLayout();

  if (loading || error || !data) {
    return <PageState loading={loading} error={error} />;
  }

  return (
    <>
      <PageHeader
        eyebrow={t.services.eyebrow}
        title={
          <>
            {t.services.titleLine1}
            <br />
            <span className="phead__title-accent">{t.services.titleLine2}</span>
          </>
        }
        lead={t.services.pageLead}
      />

      <section className="section">
        <div className="container srows">
          {data.services.map((service, index) => {
            const photo = contentImage(`service-${service.slug}.jpg`);
            // Selling points elaborate on the API's description, so they live
            // with the page that renders them.
            const points = t.serviceDetails[service.slug] ?? [];

            return (
              <article
                className={`srow${index % 2 === 1 ? ' srow--flip' : ''}`}
                key={service.id}
                id={service.slug}
              >
                <div className="srow__media">
                  {photo ? (
                    <img src={photo} alt="" loading="lazy" />
                  ) : (
                    <span className="srow__fallback" aria-hidden="true">
                      <ServiceIcon name={service.icon} size={92} />
                    </span>
                  )}
                </div>

                <div className="srow__copy">
                  <span className="srow__icon">
                    <ServiceIcon name={service.icon} size={44} />
                  </span>
                  <h2 className="srow__title">{service.title}</h2>
                  <p className="srow__text">{service.description}</p>
                  <ul className="ticks">
                    {points.map((point) => (
                      <li className="tick" key={point}>
                        <UiIcon name="shield" size={17} className="tick__icon" />
                        {point}
                      </li>
                    ))}
                  </ul>
                  <button type="button" className="btn btn--primary" onClick={openDownload}>
                    {t.services.tryPrefix} {service.title.toLowerCase()}
                  </button>
                </div>
              </article>
            );
          })}
        </div>
      </section>

      <Guarantees guarantees={data.guarantees} />
    </>
  );
}
