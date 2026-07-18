import { useEffect, useState } from 'react';
import { fetchPosts } from '../api/client';
import { PageHeader } from '../components/PageHeader';
import { PageState } from '../components/PageState';
import { PostCard } from '../components/PostCard';
import { useApi } from '../hooks/useApi';
import { useLocale } from '../i18n/LocaleContext';
import type { PostList } from '../types';

export function Blog() {
  const { locale, t } = useLocale();
  const [category, setCategory] = useState<string | null>(null);

  // Fetch every post once and filter client-side: the archive is small, and
  // this keeps the category chips instant.
  const { data, error, loading } = useApi<PostList>(() => fetchPosts(locale), `posts:${locale}`);

  // Categories are translated, so a filter picked in French means nothing in
  // English — reset it when the language changes.
  useEffect(() => {
    setCategory(null);
  }, [locale]);

  if (loading || error || !data) {
    return <PageState loading={loading} error={error} />;
  }

  const visible = category ? data.posts.filter((post) => post.category === category) : data.posts;
  const [featured, ...rest] = visible;

  return (
    <>
      <PageHeader
        eyebrow={t.blog.eyebrow}
        title={
          <>
            {t.blog.titleLine1}
            <br />
            <span className="phead__title-accent">{t.blog.titleLine2}</span>
          </>
        }
        lead={t.blog.lead}
      />

      <section className="section">
        <div className="container">
          <div className="chips" role="tablist" aria-label={t.blog.filterBy}>
            <button
              type="button"
              role="tab"
              aria-selected={category === null}
              className={`chip${category === null ? ' is-active' : ''}`}
              onClick={() => setCategory(null)}
            >
              {t.blog.all}
            </button>
            {data.categories.map((item) => (
              <button
                key={item}
                type="button"
                role="tab"
                aria-selected={category === item}
                className={`chip${category === item ? ' is-active' : ''}`}
                onClick={() => setCategory(item)}
              >
                {item}
              </button>
            ))}
          </div>

          {visible.length === 0 ? (
            <p className="empty">{t.blog.empty}</p>
          ) : (
            <>
              {featured && <PostCard post={featured} featured />}
              {rest.length > 0 && (
                <div className="pgrid">
                  {rest.map((post) => (
                    <PostCard post={post} key={post.id} />
                  ))}
                </div>
              )}
            </>
          )}
        </div>
      </section>
    </>
  );
}
