import { useLocale } from '../i18n/LocaleContext';

interface Props {
  loading: boolean;
  error: string | null;
}

/** Shared loading / error placeholder for route-level fetches. */
export function PageState({ loading, error }: Props) {
  const { t } = useLocale();

  if (error) {
    return (
      <div className="state state--error">
        <h1>{t.state.unavailable}</h1>
        <p>{error}</p>
        <p className="state__hint">{t.state.apiHint}</p>
      </div>
    );
  }

  if (loading) {
    return (
      <div className="state" aria-busy="true">
        <span className="state__spinner" />
        <p>{t.state.loading}</p>
      </div>
    );
  }

  return null;
}
