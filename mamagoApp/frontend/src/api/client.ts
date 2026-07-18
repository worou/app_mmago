import type { Locale } from '../i18n/config';
import type {
  AboutContent,
  CoverageCountry,
  JobOffer,
  JobOfferList,
  LandingContent,
  LeadPayload,
  Post,
  PostDetail,
  PostList,
  ValidationErrors,
} from '../types';

const BASE_URL = (import.meta.env.VITE_API_URL ?? 'http://127.0.0.1:8000/api').replace(/\/$/, '');

/** A 422 from Laravel, carrying the per-field messages the form renders. */
export class ApiValidationError extends Error {
  errors: ValidationErrors;

  constructor(message: string, errors: ValidationErrors) {
    super(message);
    this.name = 'ApiValidationError';
    this.errors = errors;
  }
}

/** Any other non-2xx. Carries the status so pages can tell 404 from a 500. */
export class ApiError extends Error {
  status: number;

  constructor(message: string, status: number) {
    super(message);
    this.name = 'ApiError';
    this.status = status;
  }
}

/**
 * Locale sent with every request; the SetLocale middleware reads it and the API
 * answers with translated content and validation messages.
 */
function withLocale(path: string, locale: Locale): string {
  const separator = path.includes('?') ? '&' : '?';

  return `${path}${separator}locale=${locale}`;
}

async function request<T>(path: string, locale: Locale, init?: RequestInit): Promise<T> {
  const response = await fetch(`${BASE_URL}${withLocale(path, locale)}`, {
    ...init,
    headers: {
      Accept: 'application/json',
      'Accept-Language': locale,
      ...(init?.body ? { 'Content-Type': 'application/json' } : {}),
      ...init?.headers,
    },
  });

  if (response.status === 422) {
    const body = await response.json();
    throw new ApiValidationError(body.message ?? 'Données invalides.', body.errors ?? {});
  }

  if (!response.ok) {
    throw new ApiError(
      response.status === 404 ? 'Contenu introuvable.' : `La requête a échoué (${response.status}).`,
      response.status,
    );
  }

  return response.json();
}

export async function fetchContent(locale: Locale): Promise<LandingContent> {
  const { data } = await request<{ data: LandingContent }>('/content', locale);
  return data;
}

export async function submitLead(payload: LeadPayload, locale: Locale): Promise<string> {
  const body = await request<{ message: string }>('/leads', locale, {
    method: 'POST',
    body: JSON.stringify(payload),
  });
  return body.message;
}

export async function fetchPosts(locale: Locale, category?: string): Promise<PostList> {
  const query = category ? `?category=${encodeURIComponent(category)}` : '';
  const body = await request<{ data: Post[]; meta: { categories: string[] } }>(
    `/posts${query}`,
    locale,
  );
  return { posts: body.data, categories: body.meta.categories };
}

export async function fetchPost(slug: string, locale: Locale): Promise<PostDetail> {
  const body = await request<{ data: Post; related: Post[] }>(`/posts/${slug}`, locale);
  return { post: body.data, related: body.related };
}

export async function fetchJobOffers(locale: Locale): Promise<JobOfferList> {
  const body = await request<{
    data: JobOffer[];
    meta: { departments: string[]; values: JobOfferList['values'] };
  }>('/job-offers', locale);
  return { offers: body.data, departments: body.meta.departments, values: body.meta.values };
}

export async function fetchJobOffer(slug: string, locale: Locale): Promise<JobOffer> {
  const { data } = await request<{ data: JobOffer }>(`/job-offers/${slug}`, locale);
  return data;
}

export async function fetchAbout(locale: Locale): Promise<AboutContent> {
  const { data } = await request<{ data: AboutContent }>('/about', locale);
  return data;
}

export async function fetchCoverage(locale: Locale): Promise<CoverageCountry[]> {
  const { data } = await request<{ data: CoverageCountry[] }>('/coverage', locale);
  return data;
}
