const { environment } = require('@rails/webpacker');

// Modify Babel loader to include @hotwired/turbo
const babelLoader = environment.loaders.get('babel');
babelLoader.exclude = /node_modules\/(?!@hotwired\/turbo)/;

module.exports = environment;
