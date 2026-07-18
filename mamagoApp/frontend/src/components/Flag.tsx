import type { JSX } from 'react';
import { UiIcon } from './UiIcon';

interface Props {
  code: string | null;
  name: string;
  size?: number;
}

/**
 * Circular flags drawn as SVG. Emoji flags are not an option: Windows renders
 * regional-indicator pairs as bare letters rather than a flag.
 *
 * Geometry is a 3:2 field scaled to cover the circle, matching the maquette's
 * round country tiles.
 */
const STAR =
  'M0 -1 L0.2245 -0.309 L0.951 -0.309 L0.363 0.118 L0.588 0.809 L0 0.382 L-0.588 0.809 L-0.363 0.118 L-0.951 -0.309 L-0.2245 -0.309 Z';

function Star({ x, y, r, fill }: { x: number; y: number; r: number; fill: string }) {
  return <path d={STAR} fill={fill} transform={`translate(${x} ${y}) scale(${r})`} />;
}

const FLAGS: Record<string, JSX.Element> = {
  // Orange, white, green vertical bands.
  CI: (
    <>
      <rect width="30" height="60" fill="#f77f00" />
      <rect x="30" width="30" height="60" fill="#fff" />
      <rect x="60" width="30" height="60" fill="#009e60" />
    </>
  ),
  // Green, yellow, red vertical bands with a green star centred.
  SN: (
    <>
      <rect width="30" height="60" fill="#00853f" />
      <rect x="30" width="30" height="60" fill="#fdef42" />
      <rect x="60" width="30" height="60" fill="#e31b23" />
      <Star x={45} y={30} r={9} fill="#00853f" />
    </>
  ),
  // Green, red, yellow vertical bands with a yellow star centred.
  CM: (
    <>
      <rect width="30" height="60" fill="#007a5e" />
      <rect x="30" width="30" height="60" fill="#ce1126" />
      <rect x="60" width="30" height="60" fill="#fcd116" />
      <Star x={45} y={30} r={9} fill="#fcd116" />
    </>
  ),
  // Green, yellow, red vertical bands.
  ML: (
    <>
      <rect width="30" height="60" fill="#14b53a" />
      <rect x="30" width="30" height="60" fill="#fcd116" />
      <rect x="60" width="30" height="60" fill="#ce1126" />
    </>
  ),
  // Red over green, yellow star centred.
  BF: (
    <>
      <rect width="90" height="30" fill="#ef2b2d" />
      <rect y="30" width="90" height="30" fill="#009e49" />
      <Star x={45} y={30} r={10} fill="#fcd116" />
    </>
  ),
  // Green hoist band; yellow over red on the fly.
  BJ: (
    <>
      <rect width="90" height="60" fill="#e8112d" />
      <rect width="90" height="30" fill="#fcd116" />
      <rect width="36" height="60" fill="#008751" />
    </>
  ),
  // Green, yellow, blue horizontal bands.
  GA: (
    <>
      <rect width="90" height="20" fill="#009e60" />
      <rect y="20" width="90" height="20" fill="#fcd116" />
      <rect y="40" width="90" height="20" fill="#3a75c4" />
    </>
  ),
  // Five green/yellow stripes with a red canton and white star.
  TG: (
    <>
      <rect width="90" height="60" fill="#ffce00" />
      <rect width="90" height="12" fill="#006a4e" />
      <rect y="24" width="90" height="12" fill="#006a4e" />
      <rect y="48" width="90" height="12" fill="#006a4e" />
      <rect width="36" height="36" fill="#d21034" />
      <Star x={18} y={18} r={11} fill="#fff" />
    </>
  ),
  // Sky blue field, yellow star at the hoist, red diagonal fimbriated in yellow.
  CD: (
    <>
      <rect width="90" height="60" fill="#007fff" />
      <line x1="-6" y1="66" x2="96" y2="-6" stroke="#f7d618" strokeWidth="15" />
      <line x1="-6" y1="66" x2="96" y2="-6" stroke="#ce1021" strokeWidth="9" />
      <Star x={16} y={14} r={10} fill="#f7d618" />
    </>
  ),
};

export function Flag({ code, name, size = 56 }: Props) {
  // The "Et plus encore" tile has no ISO code — render the ellipsis affordance.
  if (!code || !FLAGS[code]) {
    return (
      <span
        className="flag flag--placeholder"
        style={{ width: size, height: size }}
        role="img"
        aria-label={name}
      >
        <UiIcon name="dots" size={size * 0.5} />
      </span>
    );
  }

  return (
    <span className="flag" style={{ width: size, height: size }} role="img" aria-label={name}>
      <svg viewBox="0 0 90 60" preserveAspectRatio="xMidYMid slice">
        {FLAGS[code]}
      </svg>
    </span>
  );
}
