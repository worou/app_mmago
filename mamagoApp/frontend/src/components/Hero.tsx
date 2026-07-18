import livraisonImg from '../assets/hero/livraison.jpg';
import paiementImg from '../assets/hero/paiement.jpg';
import shoppingImg from '../assets/hero/shopping.jpg';
import transportImg from '../assets/hero/transport.jpg';
import { useLocale } from '../i18n/LocaleContext';
import type { Stat } from '../types';
import { PhoneMockup } from './PhoneMockup';
import { UiIcon } from './UiIcon';

interface Props {
  stats: Stat[];
  onDiscover: () => void;
  onDownload: () => void;
}

/** Labels come from the services list, so the cards follow the active locale. */
const FLOAT_CARDS = [
  { key: 'livraison', img: livraisonImg },
  { key: 'shopping', img: shoppingImg },
  { key: 'transport', img: transportImg },
  { key: 'paiement', img: paiementImg },
] as const;

export function Hero({ stats, onDiscover, onDownload }: Props) {
  const { t } = useLocale();

  return (
    <section className="hero" id="accueil">
      <div className="hero__skyline" aria-hidden="true" />

      <div className="container hero__inner">
        <div className="hero__copy">
          <h1 className="hero__title">
            <span className="hero__title-brand">{t.hero.titleBrand}</span>
            <span>{t.hero.titleLine1}</span>
            <span>{t.hero.titleLine2}</span>
          </h1>

          <p className="hero__lead">
            {t.hero.lead1}
            <br />
            {t.hero.lead2}
          </p>

          <div className="hero__actions">
            <button type="button" className="btn btn--primary btn--lg" onClick={onDiscover}>
              <UiIcon name="play" size={18} />
              {t.hero.discover}
            </button>
            <button type="button" className="btn btn--ghost btn--lg" onClick={onDownload}>
              {t.hero.download}
            </button>
          </div>

          <dl className="hero__stats">
            {stats.map((stat) => (
              <div className="hero__stat" key={stat.key}>
                <span className="hero__stat-icon">
                  <UiIcon name={stat.icon} size={26} />
                </span>
                <div>
                  <dt className="hero__stat-value">{stat.value}</dt>
                  <dd className="hero__stat-label">{stat.label}</dd>
                </div>
              </div>
            ))}
          </dl>
        </div>

        <div className="hero__visual">
          <div className="hero__map" aria-hidden="true">
            <svg viewBox="0 0 600 620" className="hero__map-svg">
              <defs>
                <pattern id="dots" width="9" height="9" patternUnits="userSpaceOnUse">
                  <circle cx="3" cy="3" r="1.9" fill="#39a852" />
                </pattern>
                <clipPath id="africa">
                  {/* Simplified continent outline: Maghreb across to Sinai, down
                      the Red Sea, out to the Horn, down the east coast to the
                      Cape, then up past the Gulf of Guinea to the western bulge. */}
                  <path d="M70 118 L120 100 L200 86 L300 72 L390 60 L412 95 L408 140 L420 200 L452 252 L478 282 L530 300 L500 322 L452 342 L424 398 L402 458 L372 518 L332 548 L292 508 L264 456 L252 396 L258 340 L250 302 L216 318 L160 312 L110 300 L56 258 L30 226 L58 186 L56 150 Z" />
                </clipPath>
              </defs>
              <g clipPath="url(#africa)">
                <rect width="600" height="620" fill="url(#dots)" />
              </g>
              <ellipse cx="443" cy="466" rx="13" ry="31" fill="url(#dots)" transform="rotate(-14 443 466)" />
            </svg>

            <svg viewBox="0 0 900 560" className="hero__routes">
              <path
                d="M120 130 C 220 90, 300 190, 250 260 S 180 400, 300 430"
                fill="none"
                stroke="#7cc48b"
                strokeWidth="2"
                strokeDasharray="5 7"
                strokeLinecap="round"
              />
              <path
                d="M640 120 C 780 150, 860 250, 800 330 S 700 420, 760 470"
                fill="none"
                stroke="#7cc48b"
                strokeWidth="2"
                strokeDasharray="5 7"
                strokeLinecap="round"
              />
            </svg>

            <span className="hero__pin hero__pin--1">
              <UiIcon name="pin" size={30} />
            </span>
            <span className="hero__pin hero__pin--2">
              <UiIcon name="pin" size={22} />
            </span>
            <span className="hero__pin hero__pin--3">
              <UiIcon name="pin" size={20} />
            </span>
            <span className="hero__pin hero__pin--4">
              <UiIcon name="pin" size={26} />
            </span>
            <span className="hero__pin hero__pin--5">
              <UiIcon name="pin" size={24} />
            </span>
          </div>

          <PhoneMockup />

          {FLOAT_CARDS.map((card) => (
            <figure className={`hero__card hero__card--${card.key}`} key={card.key}>
              <img src={card.img} alt="" loading="lazy" />
              <figcaption>{t.hero.cards[card.key]}</figcaption>
            </figure>
          ))}
        </div>
      </div>
    </section>
  );
}
