export type UiIconName =
  | 'users'
  | 'pin'
  | 'shield'
  | 'headset'
  | 'card'
  | 'clock'
  | 'play'
  | 'download'
  | 'search'
  | 'chevron'
  | 'arrow'
  | 'close'
  | 'dots';

interface Props {
  name: UiIconName;
  size?: number;
  className?: string;
}

/** Line-style UI glyphs. Inherit colour via `currentColor`. */
export function UiIcon({ name, size = 24, className }: Props) {
  const common = {
    width: size,
    height: size,
    viewBox: '0 0 24 24',
    fill: 'none',
    stroke: 'currentColor',
    strokeWidth: 1.9,
    strokeLinecap: 'round' as const,
    strokeLinejoin: 'round' as const,
    className,
    'aria-hidden': true,
  };

  switch (name) {
    case 'users':
      return (
        <svg {...common}>
          <circle cx="9" cy="8" r="3.2" />
          <path d="M3 19.5c0-3.2 2.7-5.3 6-5.3s6 2.1 6 5.3" />
          <path d="M16.5 6.3a3 3 0 0 1 0 5.6M18 14.6c2 .7 3.3 2.3 3.3 4.4" />
        </svg>
      );

    case 'pin':
      return (
        <svg {...common}>
          <path d="M12 21.5s7-5.6 7-11a7 7 0 0 0-14 0c0 5.4 7 11 7 11Z" />
          <circle cx="12" cy="10.2" r="2.6" />
        </svg>
      );

    case 'shield':
      return (
        <svg {...common}>
          <path d="M12 2.8 4.8 5.9v5.5c0 4.5 3 8.7 7.2 10.1 4.2-1.4 7.2-5.6 7.2-10.1V5.9L12 2.8Z" />
          <path d="m8.9 11.8 2.1 2.1 4.1-4.2" />
        </svg>
      );

    case 'headset':
      return (
        <svg {...common}>
          <path d="M4 13.4v-1.6a8 8 0 0 1 16 0v1.6" />
          <rect x="2.6" y="13" width="4.2" height="6" rx="2.1" />
          <rect x="17.2" y="13" width="4.2" height="6" rx="2.1" />
          <path d="M19.3 19c0 1.6-1.6 2.8-3.7 2.8h-1.9" />
        </svg>
      );

    case 'card':
      return (
        <svg {...common}>
          <rect x="2.6" y="5.4" width="18.8" height="13.2" rx="2.6" />
          <path d="M2.6 10h18.8M6.4 14.6h3.4" />
        </svg>
      );

    case 'clock':
      return (
        <svg {...common}>
          <circle cx="12" cy="12" r="9.2" />
          <path d="M12 6.8V12l3.4 2" />
        </svg>
      );

    case 'play':
      return (
        <svg {...common} fill="currentColor" stroke="none">
          <path d="M9 6.6a1 1 0 0 1 1.5-.9l7 5.4a1 1 0 0 1 0 1.8l-7 5.4a1 1 0 0 1-1.5-.9V6.6Z" />
        </svg>
      );

    case 'download':
      return (
        <svg {...common}>
          <path d="M12 3.4v11.4M7.6 10.6 12 15l4.4-4.4M4.4 19.6h15.2" />
        </svg>
      );

    case 'search':
      return (
        <svg {...common}>
          <circle cx="11" cy="11" r="6.6" />
          <path d="m16 16 4.6 4.6" />
        </svg>
      );

    case 'chevron':
      return (
        <svg {...common}>
          <path d="m6.5 9.5 5.5 5.5 5.5-5.5" />
        </svg>
      );

    case 'arrow':
      return (
        <svg {...common}>
          <path d="M4.6 12h14.8M13.4 6l6 6-6 6" />
        </svg>
      );

    case 'close':
      return (
        <svg {...common}>
          <path d="m6.4 6.4 11.2 11.2M17.6 6.4 6.4 17.6" />
        </svg>
      );

    case 'dots':
    default:
      return (
        <svg {...common} fill="currentColor" stroke="none">
          <circle cx="6" cy="12" r="1.9" />
          <circle cx="12" cy="12" r="1.9" />
          <circle cx="18" cy="12" r="1.9" />
        </svg>
      );
  }
}
