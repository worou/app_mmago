// Content images live in src/assets/content/ and are referenced from the API by
// bare filename (e.g. "blog-gabon.jpg"). Vite needs a static glob to fingerprint
// them, so resolve here rather than building a URL at runtime.
const modules = import.meta.glob('../assets/content/*.{jpg,jpeg,png,webp}', {
  eager: true,
  query: '?url',
  import: 'default',
}) as Record<string, string>;

/**
 * Resolve an API-provided filename to a bundled asset URL.
 * Returns undefined when the file isn't present, so callers can fall back to a
 * gradient instead of rendering a broken image.
 */
export function contentImage(filename?: string | null): string | undefined {
  if (!filename) return undefined;

  const match = Object.keys(modules).find((path) => path.endsWith(`/${filename}`));
  return match ? modules[match] : undefined;
}
