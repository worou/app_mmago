import type { ReactNode } from 'react';

interface Props {
  eyebrow: string;
  title: ReactNode;
  lead?: string;
  children?: ReactNode;
}

/** The green-tinted banner every inner page opens with. */
export function PageHeader({ eyebrow, title, lead, children }: Props) {
  return (
    <header className="phead">
      <div className="container phead__inner">
        <p className="eyebrow">{eyebrow}</p>
        <h1 className="phead__title">{title}</h1>
        {lead && <p className="phead__lead">{lead}</p>}
        {children}
      </div>
    </header>
  );
}
