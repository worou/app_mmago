import { Link, useParams } from 'react-router-dom';
import { fetchPost } from '../api/client';
import { PageState } from '../components/PageState';
import { formatDate, PostCard } from '../components/PostCard';
import { Prose } from '../components/Prose';
import { UiIcon } from '../components/UiIcon';
import { useApi } from '../hooks/useApi';
import { useLocale } from '../i18n/LocaleContext';
import { contentImage } from '../lib/images';
import type { PostDetail } from '../types';
import { NotFound } from './NotFound';

export function BlogPost() {
  const { slug = '' } = useParams();
  const { locale, t, to } = useLocale();
  const { data, error, status, loading } = useApi<PostDetail>(
    () => fetchPost(slug, locale),
    `post:${slug}:${locale}`,
  );

  if (status === 404) {
    return <NotFound />;
  }

  if (loading || error || !data) {
    return <PageState loading={loading} error={error} />;
  }

  const { post, related } = data;
  const cover = contentImage(post.cover);

  return (
    <article className="article">
      <div className="container article__head">
        <Link to={to('blog')} className="backlink">
          <UiIcon name="arrow" size={16} className="backlink__icon" />
          {t.blog.backToList}
        </Link>

        <p className="eyebrow">{post.category}</p>
        <h1 className="article__title">{post.title}</h1>
        <p className="article__lead">{post.excerpt}</p>

        <div className="article__byline">
          <span className="article__avatar" aria-hidden="true">
            {post.author.charAt(0)}
          </span>
          <div>
            <strong>{post.author}</strong>
            <span className="article__byline-meta">
              {post.author_role} ·{' '}
              <time dateTime={post.published_at}>{formatDate(post.published_at, locale)}</time> ·{' '}
              {t.blog.readTime(post.read_minutes)}
            </span>
          </div>
        </div>
      </div>

      {cover && (
        <div className="container">
          <img className="article__cover" src={cover} alt="" />
        </div>
      )}

      <div className="container article__body">
        <Prose text={post.body ?? ''} />
      </div>

      {related.length > 0 && (
        <section className="section section--tint">
          <div className="container">
            <h2 className="section__title">{t.blog.related}</h2>
            <div className="pgrid">
              {related.map((item) => (
                <PostCard post={item} key={item.id} />
              ))}
            </div>
          </div>
        </section>
      )}
    </article>
  );
}
