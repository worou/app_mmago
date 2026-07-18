import { useState } from 'react';
import { ApiValidationError, submitLead } from '../api/client';
import { useLocale } from '../i18n/LocaleContext';
import type { Country, ValidationErrors } from '../types';
import { UiIcon } from './UiIcon';
import type { UiIconName } from './UiIcon';

interface Props {
  countries: Country[];
  source: 'contact' | 'download';
  submitLabel: string;
  submitIcon?: UiIconName;
  onSuccess: (message: string) => void;
  autoFocus?: boolean;
}

type Status = 'idle' | 'sending';

/** Shared by the download modal and the contact page. */
export function LeadForm({
  countries,
  source,
  submitLabel,
  submitIcon = 'download',
  onSuccess,
  autoFocus = false,
}: Props) {
  const { locale, t } = useLocale();
  const [status, setStatus] = useState<Status>('idle');
  const [errors, setErrors] = useState<ValidationErrors>({});
  const [failure, setFailure] = useState('');

  // The API rejects the "Et plus encore" placeholder, so never offer it.
  const selectable = countries.filter((country) => !country.is_placeholder);

  async function handleSubmit(event: React.FormEvent<HTMLFormElement>) {
    event.preventDefault();
    const form = new FormData(event.currentTarget);
    const countryId = form.get('country_id');

    setStatus('sending');
    setErrors({});
    setFailure('');

    try {
      const message = await submitLead(
        {
          name: String(form.get('name') ?? ''),
          email: String(form.get('email') ?? ''),
          phone: String(form.get('phone') ?? '') || undefined,
          message: String(form.get('message') ?? '') || undefined,
          country_id: countryId ? Number(countryId) : null,
          source,
        },
        locale,
      );
      onSuccess(message);
    } catch (error) {
      if (error instanceof ApiValidationError) {
        setErrors(error.errors);
      } else {
        setFailure(error instanceof Error ? error.message : t.form.genericError);
      }
    } finally {
      setStatus('idle');
    }
  }

  return (
    <>
      {failure && <p className="modal__error">{failure}</p>}

      <form className="form" onSubmit={handleSubmit} noValidate>
        <div className="form__row">
          <label className="form__field">
            <span className="form__label">{t.form.name}</span>
            <input
              autoFocus={autoFocus}
              className="form__input"
              name="name"
              type="text"
              autoComplete="name"
              aria-invalid={Boolean(errors.name)}
            />
            {errors.name && <span className="form__error">{errors.name[0]}</span>}
          </label>

          <label className="form__field">
            <span className="form__label">{t.form.email}</span>
            <input
              className="form__input"
              name="email"
              type="email"
              autoComplete="email"
              aria-invalid={Boolean(errors.email)}
            />
            {errors.email && <span className="form__error">{errors.email[0]}</span>}
          </label>
        </div>

        <div className="form__row">
          <label className="form__field">
            <span className="form__label">{t.form.phone}</span>
            <input
              className="form__input"
              name="phone"
              type="tel"
              autoComplete="tel"
              placeholder="+225 ..."
              aria-invalid={Boolean(errors.phone)}
            />
            {errors.phone && <span className="form__error">{errors.phone[0]}</span>}
          </label>

          <label className="form__field">
            <span className="form__label">{t.form.country}</span>
            <select className="form__input" name="country_id" defaultValue="">
              <option value="">{t.form.countryPlaceholder}</option>
              {selectable.map((country) => (
                <option value={country.id} key={country.id}>
                  {country.name}
                </option>
              ))}
            </select>
            {errors.country_id && <span className="form__error">{errors.country_id[0]}</span>}
          </label>
        </div>

        <label className="form__field">
          <span className="form__label">
            {t.form.message}{' '}
            {source === 'download' && <span className="form__optional">{t.form.optional}</span>}
          </span>
          <textarea className="form__input form__input--area" name="message" rows={4} />
          {errors.message && <span className="form__error">{errors.message[0]}</span>}
        </label>

        <button
          type="submit"
          className="btn btn--primary btn--lg form__submit"
          disabled={status === 'sending'}
        >
          <UiIcon name={submitIcon} size={18} />
          {status === 'sending' ? t.form.sending : submitLabel}
        </button>
      </form>
    </>
  );
}
