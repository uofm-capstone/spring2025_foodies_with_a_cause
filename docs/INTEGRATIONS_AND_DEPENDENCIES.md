# Third-Party Integrations and Dependencies

## Ruby Gems (Backend)
Gems used in this Rails project to handle the backend and application logic.

### Core Rails Gems
- **[puma](https://github.com/puma/puma/blob/master/README.md) (~> 5.0)**: The web server used in production to serve requests.
- **[pg](https://node-postgres.com/) (~> 1.1)**: PostgreSQL database adapter, used to interact with the database.
- **[sprockets-rails](https://github.com/rails/sprockets-rails/blob/master/README.md)**: Asset pipeline for managing CSS, JavaScript, and images.
- **[importmap-rails](https://github.com/rails/importmap-rails/blob/main/README.md)**: Manages JavaScript modules using import maps.
- **[turbo-rails](https://github.com/hotwired/turbo-rails/blob/main/README.md)**: Provides Hotwire Turbo functionality, enabling faster page loads by only updating parts of the page.
- **[stimulus-rails](https://github.com/hotwired/stimulus-rails/blob/main/README.md)**: Integrates the StimulusJS framework to add client-side behavior.

### Authentication and Authorization
- **[devise](https://github.com/heartcombo/devise/blob/main/README.md)**: Provides flexible authentication for user sign-in, registration, and session management.
- **[kaminari](https://github.com/kaminari/kaminari/blob/master/README.md)**: A pagination library to display content in manageable chunks.

### Caching and Background Jobs
- **[redis](https://github.com/redis/redis/blob/unstable/README.md) (~> 4.0)**: In-memory data store used for caching and managing background jobs.

### Frontend Tools
- **[bootstrap](https://getbootstrap.com/docs/5.3/getting-started/introduction/) (~> 5.2.3)**: A responsive frontend framework for creating modern web designs.
- **[bootstrap_form](https://github.com/bootstrap-ruby/bootstrap_form/blob/main/README.md) (~> 5.2.3)**: Provides Bootstrap-styled form helpers for easier form creation.
- **[bootswatch](https://bootswatch.com/) (v5.2.3)**: A collection of free themes that work with Bootstrap.

### Development and Testing Tools
- **[capybara](https://github.com/teamcapybara/capybara/blob/master/README.md)**: For integration testing in Rails applications, simulating real user interactions.
- **[selenium-webdriver](https://www.selenium.dev/documentation/webdriver/)**: Web browser automation used in system tests.
- **[webdrivers](https://github.com/titusfortner/webdrivers/blob/main/README.md)**: Manages web drivers required for browser testing.

### Other Useful Gems
- **[jbuilder](https://github.com/rails/jbuilder/blob/main/README.md)**: A gem for building JSON responses for APIs.
- **[pgreset](https://github.com/dafalcon/pgreset/blob/main/README.md)**: Ensures all connections to the PostgreSQL database are disconnected when running `rails db:reset`.
- **[annotate](https://rubygems.org/gems/annotate/versions/2.7.1?locale=en)**: Automatically annotates model files with attribute definitions.
- **[bootsnap](https://github.com/Shopify/bootsnap/blob/main/README.md)**: Reduces boot time by caching expensive computations.
- **[tzinfo-data](https://rubygems.org/gems/tzinfo-data/versions/1.2023.3?locale=en)**: Bundles time zone data for Windows platforms.

## JavaScript Libraries (Frontend)
JavaScript libraries used to handle client-side interactions and functionality.

### Core Libraries
- **[@hotwired/stimulus](https://github.com/hotwired/stimulus/blob/main/README.md) (^3.2.2)**: A JavaScript framework to enhance HTML elements with behavior.
- **[@hotwired/turbo](https://github.com/hotwired/turbo/blob/main/README.md) (7.3.0)**: Speeds up page navigation by only replacing the parts of the page that change.

### Frontend Styling and Utilities
- **[bootstrap](https://getbootstrap.com/docs/5.3/getting-started/introduction/) (^5.3.3)**: The CSS framework that provides a responsive, mobile-first grid system and UI components.
- **[@popperjs/core](https://www.npmjs.com/package/@popperjs/core) (^2.11.8)**: A library used for positioning poppers (tooltips, dropdowns, etc.) in Bootstrap.
- **[autosize](https://github.com/jackmoore/autosize/blob/master/readme.md) (^6.0.1)**: Automatically adjusts the height of textareas based on their content.

### Build Tools
- **[webpack](https://webpack.js.org/concepts/) (^4.46.0)**: A module bundler used for modern JavaScript applications.
- **[webpack-cli](https://www.npmjs.com/package/webpack-cli) (^3.3.12)**: A command-line interface for configuring Webpack.
- **[webpack-dev-server](https://www.npmjs.com/package/webpack-dev-server) (^3)**: A development server to serve files during the development process.
- **[babel-loader](https://www.npmjs.com/package/babel-loader) (^8)**: A loader for transforming JavaScript code with Babel.

### Babel Plugins
- **[@babel/plugin-proposal-class-properties](https://www.npmjs.com/package/@babel/plugin-proposal-class-properties) (^7.18.6)**: A plugin to enable support for class properties in JavaScript.
- **[@babel/plugin-syntax-dynamic-import](https://babeljs.io/docs/babel-plugin-syntax-dynamic-import) (^7.8.3)**: A plugin for enabling dynamic `import()` syntax.
- **[@babel/plugin-transform-runtime](https://babeljs.io/docs/babel-plugin-transform-runtime) (^7.25.9)**: Optimizes JavaScript code to work more efficiently across multiple environments.
