import type { Guarantee } from '../types';
import { UiIcon } from './UiIcon';

interface Props {
  guarantees: Guarantee[];
}

export function Guarantees({ guarantees }: Props) {
  return (
    <section className="guarantees">
      <div className="container">
        <ul className="guarantees__grid">
          {guarantees.map((item) => (
            <li className="guarantees__item" key={item.id}>
              <span className="guarantees__icon">
                <UiIcon name={item.icon} size={26} />
              </span>
              <div>
                <h3 className="guarantees__title">{item.title}</h3>
                <p className="guarantees__text">{item.subtitle}</p>
              </div>
            </li>
          ))}
        </ul>
      </div>
    </section>
  );
}
