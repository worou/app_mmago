import { Routes, Route, Navigate, useLocation } from 'react-router-dom';
import { useAuth } from './context/AuthContext';
import { adminPath } from './lib/routes';
import Layout from './components/Layout';
import Login from './pages/Login';
import Dashboard from './pages/Dashboard';
import Pays from './pages/Pays';
import StatPays from './pages/StatPays';
import EspacePays from './pages/EspacePays';
import InterfacePays from './pages/InterfacePays';
import Utilisateurs from './pages/Utilisateurs';
import Parametres from './pages/Parametres';

function RequireAuth({ children }) {
  const { isAuth, ready } = useAuth();
  const loc = useLocation();
  if (!ready) {
    return (
      <div style={{ minHeight: '100vh', display: 'flex', alignItems: 'center', justifyContent: 'center', background: 'var(--bg)' }}>
        <div className="mg-spinner" />
      </div>
    );
  }
  if (!isAuth) return <Navigate to={adminPath('/login')} replace state={{ from: loc }} />;
  return children;
}

/**
 * Monte sous /admin (voir main.tsx). Les chemins sont declares en relatif :
 * le prefixe n'est ecrit qu'a un seul endroit, dans lib/routes.js.
 */
export default function App() {
  return (
    <Routes>
      <Route path="login" element={<Login />} />
      <Route
        element={
          <RequireAuth>
            <Layout />
          </RequireAuth>
        }
      >
        <Route index element={<Dashboard />} />
        <Route path="pays" element={<Pays />} />
        <Route path="stats" element={<StatPays />} />
        <Route path="stats/:paysId" element={<StatPays />} />
        {/* Espace admin genere dynamiquement pour chaque pays.
            Autrefois /admin/:paysId ; renomme en /espace/:paysId pour ne pas
            se dedoubler avec le prefixe de montage /admin. */}
        <Route path="espace/:paysId" element={<EspacePays />} />
        {/* Generation a la demande : on choisit le pays, l'interface est construite */}
        <Route path="interface" element={<InterfacePays />} />
        <Route path="interface/:paysId" element={<InterfacePays />} />
        <Route path="utilisateurs" element={<Utilisateurs />} />
        <Route path="parametres" element={<Parametres />} />
      </Route>
      <Route path="*" element={<Navigate to={adminPath('/')} replace />} />
    </Routes>
  );
}
