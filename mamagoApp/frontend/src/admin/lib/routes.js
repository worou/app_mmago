// =====================================================================
// Le back-office etait autrefois une application autonome montee a la
// racine : ses ecrans naviguent donc vers des chemins absolus ('/pays',
// '/stats/3'). Depuis la fusion il vit sous /admin, a l'interieur de
// l'application du site vitrine.
//
// Plutot que de reecrire chaque appel de navigation, on centralise le
// prefixe ici : les ecrans continuent de raisonner en chemins absolus
// « internes », ce module fait la traduction dans les deux sens.
// =====================================================================

import { useCallback } from 'react';
import { useLocation, useNavigate } from 'react-router-dom';

export const ADMIN_BASE = '/admin';

// '/pays' -> '/admin/pays'
export function adminPath(path = '/') {
  const p = String(path);
  if (!p.startsWith('/')) return p;                 // chemin relatif : inchange
  return p === '/' ? ADMIN_BASE : ADMIN_BASE + p;
}

// '/admin/pays' -> '/pays'   (ce que les ecrans croient voir)
export function stripAdminBase(pathname = '/') {
  if (pathname === ADMIN_BASE) return '/';
  if (pathname.startsWith(ADMIN_BASE + '/')) return pathname.slice(ADMIN_BASE.length);
  return pathname;
}

// Remplace useNavigate dans les ecrans du back-office.
export function useAdminNav() {
  const navigate = useNavigate();
  return useCallback(
    (to, options) => (typeof to === 'number' ? navigate(to) : navigate(adminPath(to), options)),
    [navigate]
  );
}

// Remplace useLocation().pathname : renvoie le chemin sans le prefixe,
// pour que les comparaisons de menu actif restent lisibles.
export function useAdminPathname() {
  return stripAdminBase(useLocation().pathname);
}
