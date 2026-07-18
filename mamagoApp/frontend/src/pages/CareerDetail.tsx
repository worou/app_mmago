import { Link, useParams } from 'react-router-dom';
import { fetchJobOffer } from '../api/client';
import { PageState } from '../components/PageState';
import { UiIcon } from '../components/UiIcon';
import { useApi } from '../hooks/useApi';
import { useLocale } from '../i18n/LocaleContext';
import type { JobOffer } from '../types';
import { NotFound } from './NotFound';

export function CareerDetail() {
  const { slug = '' } = useParams();
  const { locale, t, to } = useLocale();
  const { data, error, status, loading } = useApi<JobOffer>(
    () => fetchJobOffer(slug, locale),
    `offer:${slug}:${locale}`,
  );

  if (status === 404) {
    return <NotFound />;
  }

  if (loading || error || !data) {
    return <PageState loading={loading} error={error} />;
  }

  return (
    <article className="article">
      <div className="container article__head">
        <Link to={to('careers')} className="backlink">
          <UiIcon name="arrow" size={16} className="backlink__icon" />
          {t.careers.backToList}
        </Link>

        <p className="eyebrow">{data.department}</p>
        <h1 className="article__title">{data.title}</h1>

        <ul className="facts">
          <li className="fact">
            <UiIcon name="pin" size={16} />
            {data.location}
          </li>
          <li className="fact">
            <UiIcon name="clock" size={16} />
            {data.contract}
          </li>
          <li className="fact">
            <UiIcon name="users" size={16} />
            {data.department}
          </li>
        </ul>
      </div>

      <div className="container joffer">
        <div className="joffer__body">
          <section className="joffer__block">
            <h2 className="joffer__h">{t.careers.mission}</h2>
            <p className="prose-lead">{data.mission}</p>
          </section>

          <section className="joffer__block">
            <h2 className="joffer__h">{t.careers.responsibilities}</h2>
            <ul className="ticks">
              {data.responsibilities.map((item) => (
                <li className="tick" key={item}>
                  <UiIcon name="shield" size={17} className="tick__icon" />
                  {item}
                </li>
              ))}
            </ul>
          </section>

          <section className="joffer__block">
            <h2 className="joffer__h">{t.careers.requirements}</h2>
            <ul className="ticks">
              {data.requirements.map((item) => (
                <li className="tick" key={item}>
                  <UiIcon name="shield" size={17} className="tick__icon" />
                  {item}
                </li>
              ))}
            </ul>
          </section>
        </div>

        <aside className="joffer__side">
          <div className="apply">
            <h2 className="apply__title">{t.careers.applyTitle}</h2>
            <p className="apply__text">{t.careers.applyText}</p>
            <a
              className="btn btn--primary btn--lg apply__btn"
              href={`mailto:recrutement@mamago.app?subject=${encodeURIComponent(
                t.careers.applySubject(data.title),
              )}`}
            >
              <UiIcon name="arrow" size={18} />
              {t.careers.applyButton}
            </a>
            <p className="apply__meta">recrutement@mamago.app</p>
          </div>

          <div className="apply apply--soft">
            <h3 className="apply__title apply__title--sm">{t.careers.processTitle}</h3>
            <ol className="steps">
              {t.careers.processSteps.map((step) => (
                <li key={step}>{step}</li>
              ))}
            </ol>
          </div>
        </aside>
      </div>
    </article>
  );
}
