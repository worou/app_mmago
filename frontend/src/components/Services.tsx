import { Link } from 'react-router-dom';
import { useLocale } from '../i18n/LocaleContext';
import type { Service } from '../types';
import { ServiceIcon } from './ServiceIcon';
import { UiIcon } from './UiIcon';

interface Props {
  services: Service[];
}

export function Services({ services }: Props) {
  const { t, to } = useLocale();

  return (
    <section className="services" id="services">
      <div className="container services__inner">
        <header className="services__intro">
          <p className="eyebrow">{t.services.eyebrow}</p>
          <h2 className="services__title">
            {t.services.titleLine1}
            <br />
            <span className="services__title-accent">{t.services.titleLine2}</span>
          </h2>
        </header>

        <ul className="services__grid">
          {services.map((service) => (
            <li className="card" key={service.id}>
              <span className="card__icon">
                <ServiceIcon name={service.icon} />
              </span>
              <h3 className="card__title">{service.title}</h3>
              <p className="card__text">{service.description}</p>
              <Link className="card__link" to={`${to('services')}#${service.slug}`}>
                {t.services.learnMore}
                <UiIcon name="arrow" size={16} />
              </Link>
            </li>
          ))}
        </ul>
      </div>
    </section>
  );
}
