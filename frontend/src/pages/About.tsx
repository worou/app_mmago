import { Link } from 'react-router-dom';
import { fetchAbout } from '../api/client';
import { useLayout } from '../components/Layout';
import { PageHeader } from '../components/PageHeader';
import { PageState } from '../components/PageState';
import { UiIcon } from '../components/UiIcon';
import { useApi } from '../hooks/useApi';
import { useLocale } from '../i18n/LocaleContext';
import { contentImage } from '../lib/images';
import type { AboutContent } from '../types';

export function About() {
  const { locale, t, to } = useLocale();
  const { data, error, loading } = useApi<AboutContent>(() => fetchAbout(locale), `about:${locale}`);
  const { openDownload } = useLayout();

  if (loading || error || !data) {
    return <PageState loading={loading} error={error} />;
  }

  const office = contentImage('about-office.jpg');

  return (
    <>
      <PageHeader
        eyebrow={t.about.eyebrow}
        title={
          <>
            {t.about.titleLine1}
            <br />
            <span className="phead__title-accent">{t.about.titleLine2}</span>
          </>
        }
        lead={t.about.lead}
      />

      <section className="section">
        <div className="container split">
          <div className="split__media">
            {office ? (
              <img src={office} alt="" />
            ) : (
              <span className="split__fallback" aria-hidden="true">
                <UiIcon name="pin" size={54} />
              </span>
            )}
          </div>
          <div className="split__copy">
            <h2 className="section__title">{t.about.storyTitle}</h2>
            <p className="prose-lead">{t.about.storyP1}</p>
            <p className="prose-lead">{t.about.storyP2}</p>
            <dl className="minis">
              {data.stats.map((stat) => (
                <div className="mini" key={stat.key}>
                  <dt className="mini__value">{stat.value}</dt>
                  <dd className="mini__label">{stat.label}</dd>
                </div>
              ))}
            </dl>
          </div>
        </div>
      </section>

      <section className="section section--tint">
        <div className="container">
          <h2 className="section__title">{t.about.historyTitle}</h2>
          <ol className="timeline">
            {data.milestones.map((milestone) => (
              <li className="tl" key={milestone.year}>
                <span className="tl__year">{milestone.year}</span>
                <div className="tl__body">
                  <h3 className="tl__title">{milestone.title}</h3>
                  <p className="tl__text">{milestone.text}</p>
                </div>
              </li>
            ))}
          </ol>
        </div>
      </section>

      <section className="section">
        <div className="container">
          <h2 className="section__title">{t.about.valuesTitle}</h2>
          <p className="section__lead">{t.about.valuesLead}</p>
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

      <section className="section section--tint">
        <div className="container">
          <h2 className="section__title">{t.about.teamTitle}</h2>
          <p className="section__lead">{t.about.teamLead}</p>
          <ul className="tgrid">
            {data.team.map((member) => {
              const photo = contentImage(member.photo);
              return (
                <li className="tcard" key={member.id}>
                  <span className="tcard__photo">
                    {photo ? (
                      <img src={photo} alt="" loading="lazy" />
                    ) : (
                      // Initials keep the grid even until a portrait is bundled.
                      <span className="tcard__initials" aria-hidden="true">
                        {member.name
                          .split(' ')
                          .map((part) => part.charAt(0))
                          .join('')}
                      </span>
                    )}
                  </span>
                  <h3 className="tcard__name">{member.name}</h3>
                  <p className="tcard__role">{member.role}</p>
                  <p className="tcard__bio">{member.bio}</p>
                </li>
              );
            })}
          </ul>
        </div>
      </section>

      <section className="cta">
        <div className="container cta__inner">
          <div>
            <h2 className="cta__title">{t.about.ctaTitle}</h2>
            <p className="cta__text">{t.about.ctaText}</p>
          </div>
          <div className="cta__actions">
            <Link to={to('careers')} className="btn btn--primary btn--lg">
              {t.about.ctaOffers}
            </Link>
            <button type="button" className="btn btn--ghost btn--lg" onClick={openDownload}>
              {t.about.ctaDownload}
            </button>
          </div>
        </div>
      </section>
    </>
  );
}
