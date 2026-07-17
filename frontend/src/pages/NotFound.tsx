import { Link } from 'react-router-dom';
import { useLocale } from '../i18n/LocaleContext';

export function NotFound() {
  const { t, to } = useLocale();

  return (
    <div className="state state--error">
      <p className="eyebrow">{t.state.notFoundEyebrow}</p>
      <h1>{t.state.notFoundTitle}</h1>
      <p>{t.state.notFoundText}</p>
      <Link to={to('home')} className="btn btn--primary btn--lg">
        {t.state.backHome}
      </Link>
    </div>
  );
}
