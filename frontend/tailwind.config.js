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
    "border-red-500",
    "bg-white"
  ],
  theme: {
    extend: {
      fontFamily: {
        montserrat: ['Montserrat', 'sans-serif'],
      },
    },
  },
  plugins: [],
}

