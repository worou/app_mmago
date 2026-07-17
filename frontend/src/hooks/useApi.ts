import { useEffect, useState } from 'react';
import { ApiError } from '../api/client';

interface State<T> {
  data: T | null;
  error: string | null;
  /** HTTP status when the failure came from the API — lets pages tell 404 apart. */
  status: number | null;
  loading: boolean;
}

/**
 * Fetch once per key change, ignoring results from superseded requests so a
 * fast route or locale change can't be overwritten by a slower earlier response.
 *
 * The key must include every input the fetcher closes over (slug, locale),
 * otherwise the data will go stale.
 */
export function useApi<T>(fetcher: () => Promise<T>, key: string): State<T> {
  const [state, setState] = useState<State<T>>({
    data: null,
    error: null,
    status: null,
    loading: true,
  });

  useEffect(() => {
    let cancelled = false;
    setState({ data: null, error: null, status: null, loading: true });

    fetcher()
      .then((data) => {
        if (!cancelled) setState({ data, error: null, status: null, loading: false });
      })
      .catch((err: unknown) => {
        if (cancelled) return;

        setState({
          data: null,
          error: err instanceof Error ? err.message : String(err),
          status: err instanceof ApiError ? err.status : null,
          loading: false,
        });
      });

    return () => {
      cancelled = true;
    };
    // `fetcher` is re-created each render; `key` is the real dependency.
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [key]);

  return state;
}
