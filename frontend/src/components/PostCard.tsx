import { Link } from 'react-router-dom';
import type { Locale } from '../i18n/config';
import { useLocale } from '../i18n/LocaleContext';
import { contentImage } from '../lib/images';
import type { Post } from '../types';

interface Props {
  post: Post;
  featured?: boolean;
}

/** Dates follow the active locale: "24 juin 2026" vs "24 June 2026". */
export function formatDate(iso: string, locale: Locale): string {
  return new Date(iso).toLocaleDateString(locale === 'fr' ? 'fr-FR' : 'en-GB', {
    day: 'numeric',
    month: 'long',
    year: 'numeric',
  });
}

export function PostCard({ post, featured = false }: Props) {
  const { locale, t, to } = useLocale();
  const cover = contentImage(post.cover);

  return (
    <article className={`pcard${featured ? ' pcard--featured' : ''}`}>
      <Link to={to('blog', post.slug)} className="pcard__media">
        {cover ? (
          <img src={cover} alt="" loading="lazy" />
        ) : (
          // No image bundled for this post — a branded gradient keeps the grid
          // even rather than showing a broken frame.
          <span className="pcard__fallback" aria-hidden="true">
            {post.category}
          </span>
        )}
        <span className="pcard__tag">{post.category}</span>
      </Link>

      <div className="pcard__body">
        <h3 className="pcard__title">
          <Link to={to('blog', post.slug)}>{post.title}</Link>
        </h3>
        <p className="pcard__excerpt">{post.excerpt}</p>
        <footer className="pcard__meta">
          <span>{post.author}</span>
          <span aria-hidden="true">·</span>
          <time dateTime={post.published_at}>{formatDate(post.published_at, locale)}</time>
          <span aria-hidden="true">·</span>
          <span>{t.blog.minutes(post.read_minutes)}</span>
        </footer>
      </div>
    </article>
  );
}
