/**
 * This is a minimal config.
 *
 * If you need the full config, get it from here:
 * https://unpkg.com/browse/tailwindcss@latest/stubs/defaultConfig.stub.js
 */

module.exports = {
    content: [
        /**
         * HTML. Paths to Django template files that will contain Tailwind CSS classes.
         */

        /*  Templates within theme app (<tailwind_app_name>/templates), e.g. base.html. */
        '../templates/**/*.html',

        /*
         * Main templates directory of the project (BASE_DIR/templates).
         * Adjust the following line to match your project structure.
         */
        '../../templates/**/*.html',

        /*
         * Templates in other django apps (BASE_DIR/<any_app_name>/templates).
         * Adjust the following line to match your project structure.
         */
        '../../**/templates/**/*.html',

        /**
         * JS: If you use Tailwind CSS in JavaScript, uncomment the following lines and make sure
         * patterns match your project structure.
         */
        /* JS 1: Ignore any JavaScript in node_modules folder. */
        // '!../../**/node_modules',
        /* JS 2: Process all JavaScript files in the project. */
        // '../../**/*.js',

        /**
         * Python: If you use Tailwind CSS classes in Python, uncomment the following line
         * and make sure the pattern below matches your project structure.
         */
        // '../../**/*.py'
    ],
    theme: {
        extend: {
            darkMode: 'class', // Enable dark mode
            content: ['./src/**/*.{html,js}'], // Update with your project paths
            colors: {
                purplish: '#434d6d', // You can name it anything you like
                blackish: '#090b10'
              },
            screens: {
                'xsm': '300px', // Custom screen size
                'th':'1000px'
              },
            backgroundImage: {
                'top3': "url('static/top.jpg')",
                'middle': "url('static/middle.jpg')",
                'end-bg':"url('static/end1.jpg')"
              },

            height: {
                '128': '32rem', // Example of a custom height
                'more-screen': '120vh', // Height as a percentage of the viewport
                'less-screen': '80vh',
                '40vh': '40vh',
                '60vh':'60vh',
                '70vh':'70vh',
                '80vh':'80vh',
                '100': "26rem"
            },
            padding:{
                'top-18': '5rem'
            },
            boxShadow: {
                'glow-gradient': '0 0 20px 5px rgba(236, 72, 153, 0.7), 0 0 40px 10px rgba(59, 130, 246, 0.5)', // Pink to Blue glow
            },
            filter: {
                'drop-shadow-gradient': 'drop-shadow(0 0 20px rgba(236, 72, 153, 0.7)) drop-shadow(0 0 40px rgba(59, 130, 246, 0.5))', // Simulated gradient
            },
        },
    },
    plugins: [
        /**
         * '@tailwindcss/forms' is the forms plugin that provides a minimal styling
         * for forms. If you don't like it or have own styling for forms,
         * comment the line below to disable '@tailwindcss/forms'.
         */
        require('@tailwindcss/forms'),
        require('@tailwindcss/typography'),
        require('@tailwindcss/aspect-ratio'),
    ],
}
