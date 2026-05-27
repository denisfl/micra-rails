# Changelog

## [0.2.0] — 2026-05-27

- **Track Micra.js v2.2.0.** Default importmap pin now points at the
  v2.2.0 ESM bundle (`micra.js@2.2.0/dist/micra.esm.js`). Upstream
  brings full TypeScript inference (your `define()` literal now types
  `this.state.X` and `this.someMethod()`) and a ~50% faster mount path
  via single-pass DOM scan.

## [0.1.0] — 2026-05-26

- Initial release.
- Helpers: `micra_component`, `micra_includes`, `micra_state`.
- Generator: `rails g micra:install` pins micra.js via importmap and adds
  a `<%= micra_includes %>` line to the application layout.

[0.2.0]: https://github.com/denisfl/micra-rails/compare/v0.1.0...v0.2.0
[0.1.0]: https://github.com/denisfl/micra-rails/releases/tag/v0.1.0
