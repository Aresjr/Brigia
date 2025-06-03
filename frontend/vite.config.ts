import { defineConfig, loadEnv, Plugin } from "vite";
import react from "@vitejs/plugin-react-swc";
import path from "path";

declare function componentTagger(): Plugin;

export default defineConfig(({ mode }) => {

  const env = loadEnv(mode, process.cwd())

  return {
    server: {
      host: "::",
      port: Number(env.VITE_FRONTEND_PORT) || 8080,
      watch: {
        usePolling: true,
        interval: 100,
      },
    },
    plugins: [
      react(),
      mode === 'development' && componentTagger(),
    ].filter(Boolean),
    resolve: {
      alias: {
        "@": path.resolve(__dirname, "./src"),
      },
    },
  }
})
