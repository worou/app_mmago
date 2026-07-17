import { Link } from 'react-router-dom';
import type { RouteKey } from '../i18n/config';
import { useLocale } from '../i18n/LocaleContext';
import { Logo } from './Logo';

/** Company column links map to real routes; the legal ones have no page yet. */
const COMPANY_ROUTES: RouteKey[] = ['about', 'careers', 'blog', 'contact', 'contact'];

export function Footer() {
  const { t, to } = useLocale();

  return (
    <footer className="footer" id="contact">
      <div className="container footer__inner">
        <div className="footer__brand">
          <Logo variant="light" />
          <p className="footer__pitch">{t.footer.pitch}</p>
        </div>

        <nav className="footer__col" aria-label={t.footer.services}>
          <h3 className="footer__col-title">{t.footer.services}</h3>
          <ul className="footer__list">
            {t.footer.serviceLinks.map((service) => (
              <li key={service.slug}>
                <Link to={`${to('services')}#${service.slug}`} className="footer__link">
                  {service.label}
                </Link>
              </li>
            ))}
          </ul>
        </nav>

        <nav className="footer__col" aria-label={t.footer.company}>
          <h3 className="footer__col-title">{t.footer.company}</h3>
          <ul className="footer__list">
            {t.footer.companyLinks.map((label, index) => (
              <li key={label}>
                <Link to={to(COMPANY_ROUTES[index])} className="footer__link">
                  {label}
                </Link>
              </li>
            ))}
          </ul>
        </nav>

        <nav className="footer__col" aria-label={t.footer.legal}>
          <h3 className="footer__col-title">{t.footer.legal}</h3>
          <ul className="footer__list">
            {t.footer.legalLinks.map((label) => (
              <li key={label}>
                <Link to={to('home')} className="footer__link">
                  {label}
                </Link>
              </li>
            ))}
          </ul>
        </nav>
      </div>

      <div className="container footer__bottom">
        <p>{t.footer.rights(new Date().getFullYear())}</p>
        <p>{t.footer.madeWith}</p>
      </div>
    </footer>
  );
}
