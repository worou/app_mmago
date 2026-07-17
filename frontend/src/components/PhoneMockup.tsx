import promoImg from '../assets/hero/promo.jpg';
import { useLocale } from '../i18n/LocaleContext';
import { UiIcon } from './UiIcon';

/**
 * Glyph and colour per tile of the in-app grid; labels come from the
 * dictionary, positionally. This is artwork inside the hero illustration —
 * deliberately not the API's service list, which drives the marketing cards
 * further down the page.
 */
const APP_TILES = [
  { color: '#37b34a', glyph: 'car' },
  { color: '#0e8019', glyph: 'truck' },
  { color: '#e0453a', glyph: 'bag' },
  { color: '#f0a92e', glyph: 'food' },
  { color: '#37b34a', glyph: 'basket' },
  { color: '#0a6614', glyph: 'wallet' },
  { color: '#22a03a', glyph: 'ticket' },
  { color: '#f0a92e', glyph: 'dots' },
] as const;

function TileGlyph({ glyph, color }: { glyph: string; color: string }) {
  switch (glyph) {
    case 'car':
      return (
        <svg viewBox="0 0 32 32" aria-hidden="true">
          <path d="M4 20c0-1 .3-1.7 1.1-2.3l1.7-1.3 2-4.1c.5-1 1.6-1.7 2.9-1.7h7.2c1.4 0 2.6.7 3.3 1.9l2.3 4 2.3 1.3c.8.6 1.2 1.5 1.2 2.5v2c0 .6-.4 1-1 1H5c-.6 0-1-.4-1-1v-2.3Z" fill={color} />
          <circle cx="9.5" cy="22.5" r="2.7" fill="#134e20" />
          <circle cx="22.5" cy="22.5" r="2.7" fill="#134e20" />
        </svg>
      );
    case 'truck':
      return (
        <svg viewBox="0 0 32 32" aria-hidden="true">
          <rect x="3" y="10" width="14" height="10" rx="2" fill={color} />
          <path d="M17 13h5.5l4 4v3H17v-7Z" fill="#37b34a" />
          <circle cx="9" cy="22" r="2.6" fill="#134e20" />
          <circle cx="23" cy="22" r="2.6" fill="#134e20" />
        </svg>
      );
    case 'bag':
      return (
        <svg viewBox="0 0 32 32" aria-hidden="true">
          <path d="M7 10h18l1.5 15a2 2 0 0 1-2 2.2H7.5A2 2 0 0 1 5.5 25L7 10Z" fill={color} />
          <path d="M12 12V9a4 4 0 0 1 8 0v3" stroke="#8a1710" strokeWidth="1.8" fill="none" strokeLinecap="round" />
        </svg>
      );
    case 'food':
      return (
        <svg viewBox="0 0 32 32" aria-hidden="true">
          <path d="M9 5v9M9 5c-2 0-3 1.4-3 3.4S7 12 9 12M13 5v22M9 14v13" stroke={color} strokeWidth="2.2" strokeLinecap="round" fill="none" />
          <path d="M22 5c-2.6 0-4.4 3-4.4 7 0 2.6 1.2 4.4 2.8 4.9L20 27" stroke="#37b34a" strokeWidth="2.2" strokeLinecap="round" fill="none" />
        </svg>
      );
    case 'basket':
      return (
        <svg viewBox="0 0 32 32" aria-hidden="true">
          <circle cx="11" cy="12" r="4.5" fill="#e0453a" />
          <circle cx="20" cy="11" r="4" fill={color} />
          <circle cx="14" cy="20" r="4.5" fill="#f0a92e" />
          <circle cx="22" cy="19" r="4" fill="#37b34a" />
        </svg>
      );
    case 'wallet':
      return (
        <svg viewBox="0 0 32 32" aria-hidden="true">
          <rect x="4" y="9" width="24" height="15" rx="3" fill={color} />
          <path d="M19 14h9v6h-9a3 3 0 0 1 0-6Z" fill="#37b34a" />
          <circle cx="22.5" cy="17" r="1.6" fill="#fff" />
        </svg>
      );
    case 'ticket':
      return (
        <svg viewBox="0 0 32 32" aria-hidden="true">
          <rect x="6" y="6" width="20" height="20" rx="3" fill={color} />
          <rect x="9.5" y="10" width="13" height="12" rx="1.6" fill="#eaf6ec" />
          <path d="M12 14h8M12 18h5" stroke={color} strokeWidth="1.6" strokeLinecap="round" />
        </svg>
      );
    default:
      return (
        <svg viewBox="0 0 32 32" aria-hidden="true">
          <circle cx="11" cy="11" r="4.4" fill={color} />
          <circle cx="21" cy="11" r="4.4" fill="#e0453a" />
          <circle cx="11" cy="21" r="4.4" fill="#37b34a" />
          <circle cx="21" cy="21" r="4.4" fill="#0e8019" />
        </svg>
      );
  }
}

export function PhoneMockup() {
  const { t } = useLocale();

  return (
    <div className="phone" aria-hidden="true">
      <div className="phone__body">
        <div className="phone__notch" />
        <div className="phone__screen">
          <div className="phone__status">
            <span>9:41</span>
            <span className="phone__status-icons">
              <i /> <i /> <i />
            </span>
          </div>

          <div className="phone__header">
            <div className="phone__brand">
              <svg viewBox="0 0 24 24" className="phone__brand-mark">
                <circle cx="12" cy="12" r="11" fill="#fff" />
                <path d="M12 5.5a4.4 4.4 0 0 0-4.4 4.4c0 3.3 4.4 8.6 4.4 8.6s4.4-5.3 4.4-8.6A4.4 4.4 0 0 0 12 5.5Z" fill="#0e8019" />
                <circle cx="12" cy="9.8" r="1.7" fill="#fff" />
              </svg>
              <span>MamaGo</span>
            </div>
            <span className="phone__balance">{t.phone.balance}</span>
          </div>

          <div className="phone__search">
            <UiIcon name="search" size={14} />
            <span>{t.phone.search}</span>
            <UiIcon name="close" size={13} />
          </div>

          <div className="phone__grid">
            {APP_TILES.map((tile, index) => (
              <div className="phone__tile" key={t.phone.tiles[index]}>
                <span className="phone__tile-icon">
                  <TileGlyph glyph={tile.glyph} color={tile.color} />
                </span>
                <span className="phone__tile-label">{t.phone.tiles[index]}</span>
              </div>
            ))}
          </div>

          <div className="phone__promo">
            <div className="phone__promo-text">
              <span className="phone__promo-kicker">{t.phone.promoKicker}</span>
              <strong>{t.phone.promoTitle}</strong>
              <span className="phone__promo-sub">{t.phone.promoSub}</span>
            </div>
            <img src={promoImg} alt="" className="phone__promo-img" />
          </div>

          <div className="phone__nav">
            {t.phone.nav.map((item, index) => (
              <span
                key={item}
                className={`phone__nav-item${index === 2 ? ' phone__nav-item--scan' : ''}${
                  index === 0 ? ' is-active' : ''
                }`}
              >
                <i className="phone__nav-dot" />
                {item}
              </span>
            ))}
          </div>
        </div>
      </div>
    </div>
  );
}
