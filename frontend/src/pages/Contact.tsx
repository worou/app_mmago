import { useState } from 'react';
import { fetchContent } from '../api/client';
import { LeadForm } from '../components/LeadForm';
import { PageHeader } from '../components/PageHeader';
import { PageState } from '../components/PageState';
import { UiIcon } from '../components/UiIcon';
import type { UiIconName } from '../components/UiIcon';
import { useApi } from '../hooks/useApi';
import { useLocale } from '../i18n/LocaleContext';
import type { LandingContent } from '../types';

/** Icons pair with t.contact.channels by position. */
const CHANNEL_ICONS: UiIconName[] = ['headset', 'users', 'card'];

export function Contact() {
  const { locale, t } = useLocale();
  const { data, error, loading } = useApi<LandingContent>(
    () => fetchContent(locale),
    `content:${locale}`,
  );
  const [done, setDone] = useState('');

  if (loading || error || !data) {
    return <PageState loading={loading} error={error} />;
  }

  return (
    <>
      <PageHeader
        eyebrow={t.contact.eyebrow}
        title={
          <>
            {t.contact.titleLine1}
            <br />
            <span className="phead__title-accent">{t.contact.titleLine2}</span>
          </>
        }
        lead={t.contact.lead}
      />

      <section className="section">
        <div className="container contact">
          <div className="contact__form">
            {done ? (
              <div className="contact__done">
                <span className="modal__done-icon">
                  <UiIcon name="shield" size={34} />
                </span>
                <h2 className="section__title">{t.contact.doneTitle}</h2>
                <p className="section__lead">{done}</p>
                <button type="button" className="btn btn--ghost" onClick={() => setDone('')}>
                  {t.contact.sendAnother}
                </button>
              </div>
            ) : (
              <>
                <h2 className="section__title">{t.contact.formTitle}</h2>
                <p className="section__lead">{t.contact.formLead}</p>
                <LeadForm
                  countries={data.countries}
                  source="contact"
                  submitLabel={t.contact.submit}
                  submitIcon="arrow"
                  onSuccess={setDone}
                />
              </>
            )}
          </div>

          <aside className="contact__side">
            <ul className="channels">
              {t.contact.channels.map((channel, index) => (
                <li className="channel" key={channel.title}>
                  <span className="channel__icon">
                    <UiIcon name={CHANNEL_ICONS[index]} size={22} />
                  </span>
                  <div>
                    <h3 className="channel__title">{channel.title}</h3>
                    <p className="channel__text">{channel.text}</p>
                    <p className="channel__detail">{channel.detail}</p>
                  </div>
                </li>
              ))}
            </ul>

            <div className="offices">
              <h3 className="offices__title">{t.contact.officesTitle}</h3>
              <ul className="offices__list">
                {t.contact.offices.map((office) => (
                  <li className="office" key={office.city}>
                    <strong>
                      {office.city}, {office.country}
                    </strong>
                    <span>{office.line}</span>
                  </li>
                ))}
              </ul>
            </div>
          </aside>
        </div>
      </section>
    </>
  );
}
