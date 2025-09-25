/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./src/**/*.{html,ts}"
  ],
  safelist: [
    "bg-green-100",
    "bg-blue-100",
    "bg-blue-500",
    "bg-blue-600",
    "bg-blue-800",
    "bg-gray-100",
    "bg-orange-100",
    "bg-yellow-100",
    "bg-red-100",
    "border-error",
    "bg-white",
    "bg-[#60a5fa]",
    "bg-[#3B82F6]",
    "bg-[#2563EB]",
    "bg-[#06B6D4]",
    "bg-[#EF4444]",
    "bg-[#F59E0B]",
    "bg-[#14B8A6]",
    "bg-[#A78BFA]"
  ],
  theme: {
    extend: {
      fontFamily: {
        montserrat: ['Montserrat', 'sans-serif'],
      },
      scale: {
        102: '1.02'
      }
    },
  },
  plugins: [
    require('daisyui')
  ],
  daisyui: {
    themes: [
      "dark", "light", "emerald", "fantasy",
      {
        brigida: {
          "primary": "#2563eb",     // Azul principal (confiança)
          "secondary": "#10b981",   // Verde suave (saúde)
          "accent": "#60a5fa",      // Azul claro para destaques
          "neutral": "#6b7280",          // slate-500 (mid-dark neutral)
          "neutral-content": "#ffffff",  // white text on it
          "base-content": "#1f2937", // texto principal (preto/cinza escuro)
          "base-100": "#ffffff",    // Fundo claro
          "base-200": "#f3f4f6",    // Mais escuro que antes (#f3f4f6)
          "base-300": "#e5e7eb",    // Mais contraste, próximo do slate-300
          "info": "#38bdf8",        // Azul claro para info
          "success": "#22c55e",     // Verde sucesso
          "success-content": "#ffffff",
          "warning": "#facc15",     // Amarelo alerta
          "error": "#ef4444",       // Vermelho erro
          "error-content": "#ffffff"
        },
        "nemeia": {
          "primary": "#3b3667",           // Indigo escuro
          "secondary": "#2563eb",         // Azul vivo para contraste
          "accent": "#5c6ac4",            // Indigo claro para destaques
          "neutral": "#1f2937",           // slate-800 (fundo escuro principal)
          "neutral-content": "#f9fafb",   // texto claro sobre neutral
          "base-content": "#f9fafb",      // texto principal claro
          "base-100": "#111827",          // fundo escuro primário
          "base-200": "#1e293b",          // fundo secundário
          "base-300": "#374151",          // fundo terciário
          "info": "#3b82f6",              // azul para informação
          "success": "#22c55e",           // verde sucesso
          "success-content": "#ffffff",
          "warning": "#f59e0b",           // amarelo alerta
          "error": "#dc2626",             // vermelho erro
          "error-content": "#ffffff"
        }
      }
    ],
  },
}

