import { useLocale } from '../i18n/LocaleContext';

interface Props {
  /** Rendered on the dark countries band, where the wordmark must invert. */
  variant?: 'default' | 'light';
  showTagline?: boolean;
}

export function Logo({ variant = 'default', showTagline = true }: Props) {
  const { t } = useLocale();
  const light = variant === 'light';

  return (
    <span className={`logo${light ? ' logo--light' : ''}`}>
      <svg className="logo__mark" viewBox="0 0 64 64" aria-hidden="true">
        <circle cx="32" cy="32" r="30" fill="#fcd116" />
        <circle cx="32" cy="32" r="24" fill="#0a6614" />
        <path d="M20 38h24v6H20z" fill="#fcd116" />
        <rect x="22" y="22" width="20" height="14" rx="3" fill="#eaf6ec" />
        <path d="M25 26h14v3H25zM25 31h9v2.4h-9z" fill="#0a6614" />
        <circle cx="24" cy="45" r="3.4" fill="#0f2324" />
        <circle cx="40" cy="45" r="3.4" fill="#0f2324" />
      </svg>

      <span className="logo__text">
        <span className="logo__word">
          Mama<span className="logo__word-accent">Go</span>
        </span>
        {showTagline && <span className="logo__tagline">{t.logo.tagline}</span>}
      </span>
    </span>
  );
}
