import type { ServiceIconName } from '../types';

interface Props {
  name: ServiceIconName;
  size?: number;
}

/**
 * Flat service glyphs matching the maquette's card icons. Unknown icon names
 * fall back to the generic grid so a new seeded service never renders blank.
 */
export function ServiceIcon({ name, size = 56 }: Props) {
  const common = {
    width: size,
    height: size,
    viewBox: '0 0 64 64',
    fill: 'none',
    'aria-hidden': true,
  } as const;

  switch (name) {
    case 'car':
      return (
        <svg {...common}>
          <path
            d="M8 40c0-2 .6-3.4 2.2-4.6l3.4-2.6 4-8.2C18.6 22 20.8 20.6 23.4 20.6h14.4c2.8 0 5.2 1.4 6.6 3.8l4.6 8 4.6 2.6C55.2 36.2 56 38 56 40v4c0 1.1-.9 2-2 2H10c-1.1 0-2-.9-2-2v-4Z"
            fill="#22a03a"
          />
          <path
            d="M18.6 25.6c.8-1.6 2.4-2.6 4.2-2.6h13.8c1.9 0 3.6 1 4.5 2.6l3.8 6.6H15l3.6-6.6Z"
            fill="#eaf6ec"
          />
          <circle cx="19" cy="45" r="5.4" fill="#0a6614" />
          <circle cx="45" cy="45" r="5.4" fill="#0a6614" />
          <circle cx="19" cy="45" r="2.2" fill="#eaf6ec" />
          <circle cx="45" cy="45" r="2.2" fill="#eaf6ec" />
        </svg>
      );

    case 'scooter':
      return (
        <svg {...common}>
          <rect x="12" y="20" width="14" height="15" rx="3" fill="#22a03a" />
          <path d="M14 24h10M14 28h10" stroke="#eaf6ec" strokeWidth="1.6" strokeLinecap="round" />
          <path
            d="M26 34h9c3 0 5 1.6 6.4 4l3 5.4"
            stroke="#0e8019"
            strokeWidth="3.4"
            strokeLinecap="round"
          />
          <path
            d="M42 22h5.2c1 0 1.8.8 1.8 1.8V38"
            stroke="#0a6614"
            strokeWidth="3.4"
            strokeLinecap="round"
          />
          <path d="M18 40h20" stroke="#0e8019" strokeWidth="3.4" strokeLinecap="round" />
          <circle cx="17" cy="44" r="6" fill="#0a6614" />
          <circle cx="47" cy="44" r="6" fill="#0a6614" />
          <circle cx="17" cy="44" r="2.4" fill="#eaf6ec" />
          <circle cx="47" cy="44" r="2.4" fill="#eaf6ec" />
        </svg>
      );

    case 'bag':
      return (
        <svg {...common}>
          <path
            d="M14 22h36l3 30a4 4 0 0 1-4 4.4H15A4 4 0 0 1 11 52l3-30Z"
            fill="#0e8019"
          />
          <path
            d="M24 26v-4a8 8 0 0 1 16 0v4"
            stroke="#0a6614"
            strokeWidth="3.4"
            strokeLinecap="round"
          />
          <path d="M26 34h12" stroke="#eaf6ec" strokeWidth="3" strokeLinecap="round" />
        </svg>
      );

    case 'food':
      return (
        <svg {...common}>
          <path d="M12 26c0-6.6 6.3-11 20-11s20 4.4 20 11H12Z" fill="#f0a92e" />
          <path
            d="M11 30h42a2 2 0 0 1 0 6H11a2 2 0 0 1 0-6Z"
            fill="#e0453a"
          />
          <path d="M13 40h38l-2.4 10A5 5 0 0 1 43.7 54H20.3a5 5 0 0 1-4.9-4L13 40Z" fill="#f0a92e" />
          <circle cx="24" cy="22" r="1.8" fill="#fff6e6" />
          <circle cx="33" cy="20" r="1.8" fill="#fff6e6" />
          <circle cx="41" cy="22.5" r="1.8" fill="#fff6e6" />
        </svg>
      );

    case 'wallet':
      return (
        <svg {...common}>
          <path d="M12 22 44 12l3 9H12v1Z" fill="#8fd39c" />
          <rect x="8" y="20" width="46" height="30" rx="6" fill="#0a6614" />
          <path d="M36 30h20v12H36a6 6 0 0 1 0-12Z" fill="#0e8019" />
          <circle cx="43" cy="36" r="3.4" fill="#eaf6ec" />
        </svg>
      );

    case 'wallet-alt':
      return (
        <svg {...common}>
          <path d="M12 22 46 10l2.6 9H12v3Z" fill="#a8e0b4" />
          <rect x="8" y="20" width="46" height="30" rx="6" fill="#3fb551" />
          <path d="M36 30h20v12H36a6 6 0 0 1 0-12Z" fill="#0a6614" />
          <circle cx="43" cy="36" r="3.4" fill="#eaf6ec" />
        </svg>
      );

    case 'grid':
    default:
      return (
        <svg {...common}>
          <circle cx="22" cy="22" r="10.5" fill="#0e8019" />
          <circle cx="43" cy="22" r="10.5" fill="#22a03a" />
          <circle cx="22" cy="43" r="10.5" fill="#22a03a" />
          <circle cx="43" cy="43" r="10.5" fill="#0e8019" />
        </svg>
      );
  }
}
