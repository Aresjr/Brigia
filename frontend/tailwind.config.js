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
    "bg-white"
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
          "neutral": "#9ca3af",          // cinza médio
          "neutral-content": "#ffffff",  // texto branco em cima do cinza médio
          "base-content": "#1f2937", // texto principal (preto/cinza escuro)
          "base-100": "#ffffff",    // Fundo claro
          "base-200": "#f3f4f6",    // Fundo alternativo
          "base-300": "#d1d5db",    // Bordas e divisores
          "info": "#38bdf8",        // Azul claro para info
          "success": "#22c55e",     // Verde sucesso
          "success-content": "#ffffff",
          "warning": "#facc15",     // Amarelo alerta
          "error": "#ef4444",       // Vermelho erro
        },
      }
    ],
  },
}

