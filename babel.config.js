module.exports = function (api) {
  api.cache(true);

  return {
    presets: [
      [
        '@babel/preset-env',
        {
          targets: '> 0.25%, not dead',
          useBuiltIns: 'entry',
          corejs: 3,
        },
      ],
    ],
    plugins: [
      '@babel/plugin-proposal-class-properties',
      '@babel/plugin-proposal-private-methods',
      '@babel/plugin-proposal-private-property-in-object',
      '@babel/plugin-proposal-optional-chaining',
      '@babel/plugin-proposal-nullish-coalescing-operator',
    ],
    overrides: [
      {
        test: /node_modules\/@hotwired\/turbo/, // Ensure Turbo is transpiled
        presets: [
          [
            '@babel/preset-env',
            {
              targets: '> 0.25%, not dead',
              useBuiltIns: 'entry',
              corejs: 3,
            },
          ],
        ],
      },
    ],
  };
};
