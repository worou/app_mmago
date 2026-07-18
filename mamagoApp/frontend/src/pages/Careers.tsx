import { useEffect, useState } from 'react';
import { Link } from 'react-router-dom';
import { fetchJobOffers } from '../api/client';
import { PageHeader } from '../components/PageHeader';
import { PageState } from '../components/PageState';
import { UiIcon } from '../components/UiIcon';
import { useApi } from '../hooks/useApi';
import { useLocale } from '../i18n/LocaleContext';
import { contentImage } from '../lib/images';
import type { JobOfferList } from '../types';

export function Careers() {
  const { locale, t, to } = useLocale();
  const [department, setDepartment] = useState<string | null>(null);
  const { data, error, loading } = useApi<JobOfferList>(
    () => fetchJobOffers(locale),
    `job-offers:${locale}`,
  );

  // Departments are translated, so a filter picked in one language means
  // nothing in the other.
  useEffect(() => {
    setDepartment(null);
  }, [locale]);

  if (loading || error || !data) {
    return <PageState loading={loading} error={error} />;
  }

  const visible = department
    ? data.offers.filter((offer) => offer.department === department)
    : data.offers;
  const team = contentImage('careers-team.jpg');

  return (
    <>
      <PageHeader
        eyebrow={t.careers.eyebrow}
        title={
          <>
            {t.careers.titleLine1}
            <br />
            <span className="phead__title-accent">{t.careers.titleLine2}</span>
          </>
        }
        lead={t.careers.lead}
      />

      <section className="section">
        <div className="container split">
          <div className="split__media">
            {team ? (
              <img src={team} alt="" />
            ) : (
              <span className="split__fallback" aria-hidden="true">
                <UiIcon name="users" size={54} />
              </span>
            )}
          </div>
          <div className="split__copy">
            <h2 className="section__title">{t.careers.whyTitle}</h2>
            <p className="prose-lead">{t.careers.whyText}</p>
            <ul className="ticks">
              {t.careers.perks.map((perk) => (
                <li className="tick" key={perk}>
                  <UiIcon name="shield" size={17} className="tick__icon" />
                  {perk}
                </li>
              ))}
            </ul>
          </div>
        </div>
      </section>

      <section className="section section--tint">
        <div className="container">
          <h2 className="section__title">{t.careers.valuesTitle}</h2>
          <ul className="vgrid">
            {data.values.map((value) => (
              <li className="vcard" key={value.id}>
                <span className="vcard__icon">
                  <UiIcon name={value.icon} size={24} />
                </span>
                <h3 className="vcard__title">{value.title}</h3>
                <p className="vcard__text">{value.description}</p>
              </li>
            ))}
          </ul>
        </div>
      </section>

      <section className="section">
        <div className="container">
          <h2 className="section__title">
            {t.careers.openRoles} <span className="count">{data.offers.length}</span>
          </h2>

          <div className="chips" role="tablist" aria-label={t.careers.filterBy}>
            <button
              type="button"
              role="tab"
              aria-selected={department === null}
              className={`chip${department === null ? ' is-active' : ''}`}
              onClick={() => setDepartment(null)}
            >
              {t.careers.allDepartments}
            </button>
            {data.departments.map((item) => (
              <button
                key={item}
                type="button"
                role="tab"
                aria-selected={department === item}
                className={`chip${department === item ? ' is-active' : ''}`}
                onClick={() => setDepartment(item)}
              >
                {item}
              </button>
            ))}
          </div>

          {visible.length === 0 ? (
            <p className="empty">{t.careers.empty}</p>
          ) : (
            <ul className="jlist">
              {visible.map((offer) => (
                <li key={offer.id}>
                  <Link to={to('careers', offer.slug)} className="jrow">
                    <div className="jrow__main">
                      <h3 className="jrow__title">{offer.title}</h3>
                      <p className="jrow__excerpt">{offer.excerpt}</p>
                    </div>
                    <div className="jrow__meta">
                      <span className="jrow__tag">{offer.department}</span>
                      <span className="jrow__facts">
                        <UiIcon name="pin" size={14} /> {offer.location} · {offer.contract}
                      </span>
                    </div>
                    <UiIcon name="arrow" size={20} className="jrow__arrow" />
                  </Link>
                </li>
              ))}
            </ul>
          )}
        </div>
      </section>
    </>
  );
}
