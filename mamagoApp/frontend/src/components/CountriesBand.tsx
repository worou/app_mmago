import { useLocale } from '../i18n/LocaleContext';
import type { Country } from '../types';
import { Flag } from './Flag';

interface Props {
  countries: Country[];
}

export function CountriesBand({ countries }: Props) {
  const { t } = useLocale();

  return (
    <section className="band" id="pays">
      <div className="container">
        <div className="band__inner">
          <div className="band__copy">
            <h2 className="band__title">
              {t.band.title}
              <span className="band__title-soft">{t.band.subtitle}</span>
            </h2>
            <p className="band__text">{t.band.text}</p>
          </div>

          <ul className="band__grid">
            {countries.map((country) => (
              <li className="band__country" key={country.id}>
                <Flag code={country.code} name={country.name} size={42} />
                <span className="band__country-name">{country.name}</span>
              </li>
            ))}
          </ul>
        </div>
      </div>
    </section>
  );
}
