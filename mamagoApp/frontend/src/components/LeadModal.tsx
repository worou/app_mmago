import { useEffect, useState } from 'react';
import { useLocale } from '../i18n/LocaleContext';
import type { Country } from '../types';
import { LeadForm } from './LeadForm';
import { UiIcon } from './UiIcon';

interface Props {
  open: boolean;
  countries: Country[];
  onClose: () => void;
}

export function LeadModal({ open, countries, onClose }: Props) {
  const { t } = useLocale();
  const [done, setDone] = useState('');

  useEffect(() => {
    if (!open) return;

    setDone('');

    const onKey = (event: KeyboardEvent) => {
      if (event.key === 'Escape') onClose();
    };
    document.addEventListener('keydown', onKey);
    document.body.style.overflow = 'hidden';

    return () => {
      document.removeEventListener('keydown', onKey);
      document.body.style.overflow = '';
    };
  }, [open, onClose]);

  if (!open) return null;

  return (
    <div
      className="modal"
      onMouseDown={(event) => {
        // Only a click on the backdrop itself closes the modal.
        if (event.target === event.currentTarget) onClose();
      }}
    >
      <div className="modal__panel" role="dialog" aria-modal="true" aria-labelledby="lead-title">
        <button type="button" className="modal__close" onClick={onClose} aria-label={t.modal.close}>
          <UiIcon name="close" size={20} />
        </button>

        {done ? (
          <div className="modal__done">
            <span className="modal__done-icon">
              <UiIcon name="shield" size={34} />
            </span>
            <h2 id="lead-title" className="modal__title">
              {t.modal.doneTitle}
            </h2>
            <p className="modal__lead">{done}</p>
            <button type="button" className="btn btn--primary btn--lg" onClick={onClose}>
              {t.modal.close}
            </button>
          </div>
        ) : (
          <>
            <h2 id="lead-title" className="modal__title">
              {t.modal.title}
            </h2>
            <p className="modal__lead">{t.modal.lead}</p>

            <LeadForm
              countries={countries}
              source="download"
              submitLabel={t.modal.submit}
              submitIcon="download"
              onSuccess={setDone}
              autoFocus
            />
          </>
        )}
      </div>
    </div>
  );
}
