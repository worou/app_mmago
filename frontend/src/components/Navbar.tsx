import { useEffect, useRef, useState } from 'react';
import { Link, NavLink, useLocation, useNavigate } from 'react-router-dom';
import { LOCALE_LABELS, LOCALES, swapLocale, type RouteKey } from '../i18n/config';
import { useLocale } from '../i18n/LocaleContext';
import { Logo } from './Logo';
import { UiIcon } from './UiIcon';

// Route keys double as label keys: t.nav has an entry per route.
const LINKS: RouteKey[] = ['home', 'about', 'services', 'countries', 'careers', 'blog', 'contact'];

interface Props {
  onDownload: () => void;
}

export function Navbar({ onDownload }: Props) {
  const { locale, t, to } = useLocale();
  const [menuOpen, setMenuOpen] = useState(false);
  const [langOpen, setLangOpen] = useState(false);
  const langRef = useRef<HTMLDivElement>(null);
  const { pathname } = useLocation();
  const navigate = useNavigate();

  // Lock scroll while the mobile drawer is open.
  useEffect(() => {
    document.body.style.overflow = menuOpen ? 'hidden' : '';
    return () => {
      document.body.style.overflow = '';
    };
  }, [menuOpen]);

  // Close the drawer on navigation.
  useEffect(() => {
    setMenuOpen(false);
  }, [pathname]);

  // Close the language menu on an outside click or Escape. A blur handler was
  // unreliable: clicking a non-focusable element never blurred the button, so
  // the menu stayed open and the next button click toggled it shut, making the
  // control feel dead. Listen for mousedown and touchstart to cover both mouse
  // and touch without depending on synthesised pointer events.
  useEffect(() => {
    if (!langOpen) return;

    const onOutside = (event: Event) => {
      if (!langRef.current?.contains(event.target as Node)) {
        setLangOpen(false);
      }
    };
    const onKey = (event: KeyboardEvent) => {
      if (event.key === 'Escape') setLangOpen(false);
    };

    document.addEventListener('mousedown', onOutside);
    document.addEventListener('touchstart', onOutside);
    document.addEventListener('keydown', onKey);
    return () => {
      document.removeEventListener('mousedown', onOutside);
      document.removeEventListener('touchstart', onOutside);
      document.removeEventListener('keydown', onKey);
    };
  }, [langOpen]);

  return (
    <header className="nav">
      <div className="container nav__inner">
        <Link to={to('home')} className="nav__logo" aria-label={t.nav.homeAria}>
          <Logo />
        </Link>

        <nav className={`nav__links${menuOpen ? ' is-open' : ''}`} aria-label={t.nav.mainNav}>
          {LINKS.map((key) => (
            <NavLink
              key={key}
              to={to(key)}
              end={key === 'home'}
              className={({ isActive }) => `nav__link${isActive ? ' is-active' : ''}`}
            >
              {t.nav[key]}
            </NavLink>
          ))}
        </nav>

        <div className="nav__actions">
          <div className="lang" ref={langRef}>
            <button
              type="button"
              className="lang__btn"
              aria-expanded={langOpen}
              aria-haspopup="listbox"
              aria-label={t.nav.language}
              onClick={() => setLangOpen((open) => !open)}
            >
              {LOCALE_LABELS[locale]}
              <UiIcon name="chevron" size={16} />
            </button>
            {langOpen && (
              <ul className="lang__menu" role="listbox">
                {LOCALES.map((option) => (
                  <li key={option}>
                    <button
                      type="button"
                      role="option"
                      aria-selected={option === locale}
                      lang={option}
                      className="lang__option"
                      onClick={() => {
                        setLangOpen(false);
                        // Stay on the same page in the other language.
                        navigate(swapLocale(pathname, option));
                      }}
                    >
                      {LOCALE_LABELS[option]}
                    </button>
                  </li>
                ))}
              </ul>
            )}
          </div>

          <button type="button" className="btn btn--primary nav__cta" onClick={onDownload}>
            {t.nav.download}
          </button>

          <button
            type="button"
            className="nav__burger"
            aria-label={menuOpen ? t.nav.closeMenu : t.nav.openMenu}
            aria-expanded={menuOpen}
            onClick={() => setMenuOpen((open) => !open)}
          >
            <UiIcon name={menuOpen ? 'close' : 'dots'} size={22} />
          </button>
        </div>
      </div>
    </header>
  );
}
