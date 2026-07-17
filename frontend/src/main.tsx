import { StrictMode } from 'react'
import { createRoot } from 'react-dom/client'
import { BrowserRouter, Route, Routes } from 'react-router-dom'
import './index.css'
import './App.css'
import './pages.css'
import { Layout } from './components/Layout'
import { LOCALES, ROUTES, type Locale } from './i18n/config'
import { About } from './pages/About'
import { Blog } from './pages/Blog'
import { BlogPost } from './pages/BlogPost'
import { CareerDetail } from './pages/CareerDetail'
import { Careers } from './pages/Careers'
import { Contact } from './pages/Contact'
import { Countries } from './pages/Countries'
import { Home } from './pages/Home'
import { NotFound } from './pages/NotFound'
import { ServicesPage } from './pages/ServicesPage'

/**
 * The same tree is mounted once per locale: French at the root, English under
 * /en, each with its own path segments so URLs read naturally in both.
 */
function localeRoutes(locale: Locale) {
  return (
    <Route
      key={locale}
      path={locale === 'fr' ? '/' : `/${locale}`}
      element={<Layout locale={locale} />}
    >
      <Route index element={<Home />} />
      <Route path={ROUTES.about[locale]} element={<About />} />
      <Route path={ROUTES.services[locale]} element={<ServicesPage />} />
      <Route path={ROUTES.countries[locale]} element={<Countries />} />
      <Route path={ROUTES.careers[locale]} element={<Careers />} />
      <Route path={`${ROUTES.careers[locale]}/:slug`} element={<CareerDetail />} />
      <Route path={ROUTES.blog[locale]} element={<Blog />} />
      <Route path={`${ROUTES.blog[locale]}/:slug`} element={<BlogPost />} />
      <Route path={ROUTES.contact[locale]} element={<Contact />} />
      <Route path="*" element={<NotFound />} />
    </Route>
  )
}

createRoot(document.getElementById('root')!).render(
  <StrictMode>
    <BrowserRouter>
      <Routes>
        {/* English first: /en must win before the French catch-all at /. */}
        {[...LOCALES].reverse().map(localeRoutes)}
      </Routes>
    </BrowserRouter>
  </StrictMode>,
)
