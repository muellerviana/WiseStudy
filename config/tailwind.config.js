const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './public/*.html',
    './app/assets/stylesheets/application.tailwind.css',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/inputs/**/*.rb',
    './app/views/**/*.{erb,haml,html,slim,rb}',
    './app/view_components/**/*.{erb,html,rb}',
    './app/view_components/previews/**/*.{erb,html,rb}',
    './app/components/**/*.{erb,haml,html,slim}',
    './app/assets/stylesheets/**/*.css',
    './spec/view_components/previews/**/*.{erb,html,rb',
    './pages/**/*.{html,js}',
    './components/**/*.{html,js}',
    './src/pages/**/*.{html,js}',
    './src/components/**/*.{html,js}',
    './app/components/**/*.{erb,rb}', // Custom components
    './src/layouts/**/*.{html,js}',
    './src/index.html',
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      },
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/container-queries'),
  ]
}
