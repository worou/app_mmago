export type ServiceIconName =
  | 'car'
  | 'scooter'
  | 'bag'
  | 'food'
  | 'wallet'
  | 'wallet-alt'
  | 'grid';

export interface Service {
  id: number;
  slug: string;
  title: string;
  description: string;
  icon: ServiceIconName;
  link: string | null;
}

export interface Country {
  id: number;
  name: string;
  /** ISO 3166-1 alpha-2. Null for the "Et plus encore" tile. */
  code: string | null;
  is_placeholder: boolean;
}

export interface Stat {
  key: string;
  value: string;
  label: string;
  icon: 'users' | 'pin' | 'shield' | 'headset';
}

export interface Guarantee {
  id: number;
  title: string;
  subtitle: string;
  icon: 'shield' | 'card' | 'headset' | 'clock';
}

export interface LandingContent {
  services: Service[];
  countries: Country[];
  stats: Stat[];
  guarantees: Guarantee[];
}

export interface LeadPayload {
  name: string;
  email: string;
  phone?: string;
  country_id?: number | null;
  message?: string;
  source: 'contact' | 'download';
}

/** Field-keyed messages from Laravel's 422 response. */
export type ValidationErrors = Record<string, string[]>;

export interface Post {
  id: number;
  slug: string;
  title: string;
  category: string;
  excerpt: string;
  author: string;
  author_role: string;
  cover: string | null;
  read_minutes: number;
  published_at: string;
  is_featured: boolean;
  /** Only present on the detail endpoint. */
  body?: string;
}

export interface PostList {
  posts: Post[];
  categories: string[];
}

export interface PostDetail {
  post: Post;
  related: Post[];
}

export interface JobOffer {
  id: number;
  slug: string;
  title: string;
  department: string;
  location: string;
  contract: string;
  excerpt: string;
  mission: string;
  responsibilities: string[];
  requirements: string[];
}

export interface Value {
  id: number;
  title: string;
  description: string;
  icon: 'users' | 'pin' | 'shield' | 'headset' | 'card' | 'clock';
}

export interface JobOfferList {
  offers: JobOffer[];
  departments: string[];
  values: Value[];
}

export interface TeamMember {
  id: number;
  name: string;
  role: string;
  bio: string;
  photo: string | null;
}

export interface Milestone {
  year: string;
  title: string;
  text: string;
}

export interface AboutContent {
  values: Value[];
  team: TeamMember[];
  stats: Stat[];
  milestones: Milestone[];
}

export interface City {
  id: number;
  name: string;
  is_capital: boolean;
  services: string[];
}

export interface CoverageCountry {
  id: number;
  name: string;
  code: string | null;
  cities: City[];
}
