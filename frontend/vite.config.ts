import { defineConfig, loadEnv } from "vite";
import react from "@vitejs/plugin-react-swc";
import path from "path";

export default defineConfig(({ mode }) => {

  const env = loadEnv(mode, process.cwd())

  return {
    server: {
      host: "::",
      port: Number(env.VITE_FRONTEND_PORT) || 8081,
      watch: {
        usePolling: true,
        interval: 100,
      },
    },
    plugins: [
      react()
    ].filter(Boolean),
    resolve: {
      alias: {
        "@": path.resolve(__dirname, "./src"),
      },
    },
  }
})
