import react from '@vitejs/plugin-react'
import { defineConfig } from 'vite'

// https://vite.dev/config/
export default defineConfig({
  plugins: [react()],
  server: {
    // 5173 is taken by the separate /htdocs/mamago admin app. Pin a dedicated
    // port and fail loudly rather than drifting onto a fallback the API's CORS
    // allowlist doesn't know about.
    port: 5180,
    strictPort: true,
  },
})
