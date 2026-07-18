import App from './App';
import { ThemeProvider } from './context/ThemeContext';
import { AuthProvider } from './context/AuthContext';
import { ToastProvider } from './context/ToastContext';
import './theme.css';

/**
 * Racine du back-office a l'interieur de l'application unifiee.
 *
 * Le back-office etait autrefois une application React separee, avec son
 * propre point d'entree. Il est desormais monte sous /admin par le routeur
 * du site vitrine : il n'apporte donc plus ni <BrowserRouter> ni createRoot,
 * seulement ses fournisseurs de contexte et son conteneur de style.
 *
 * Le div `.mg-admin` porte tout le theme du back-office (voir theme.css) :
 * les pages du site vitrine n'en heritent pas, et n'instancient pas non plus
 * ces contextes.
 */
export default function AdminRoot() {
  return (
    <div className="mg-admin">
      <ThemeProvider>
        <AuthProvider>
          <ToastProvider>
            <App />
          </ToastProvider>
        </AuthProvider>
      </ThemeProvider>
    </div>
  );
}
