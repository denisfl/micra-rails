# Changelog

## [0.4.0] — 2026-06-26

- **Track Micra.js v2.7.0**, and pin the **`@2` major range** by default
  (`micra.js@2/dist/micra.esm.js`) instead of a single patch version. Apps now pick
  up Micra 2.x patches and minors automatically — no gem bump needed — and never
  jump a breaking major. Re-pin a specific version in your `config/importmap.rb` if
  you prefer it locked.
- Upstream since 2.3.0 adds `destroy()` + `autoCleanup()` (clean teardown for
  islands swapped out by htmx/Turbo), plus fixes. See the upstream
  [changelog](https://github.com/denisfl/micra.js/blob/master/CHANGELOG.md).
- No gem-side API changes — `micra_component`, `micra_includes`, and `micra_state`
  work unchanged.
- Existing apps that ran `micra:install` keep the version their `config/importmap.rb`
  already pins; re-pin to `@2` to opt into auto-updates.

## [0.3.0] — 2026-05-30

- **Track Micra.js v2.3.0.** Default importmap pin now points at the
  v2.3.0 ESM bundle (`micra.js@2.3.0/dist/micra.esm.js`). Upstream
  brings a type-safe event bus via the augmentable `MicraEvents`
  interface (declare your app's events once, `this.emit` /
  `this.on` enforce payload types and arity at the call site) and a
  positional-reuse diff for non-keyed `<template data-each>` lists —
  re-renders no longer rebuild the entire list, retained rows keep
  DOM identity and event listeners. See the upstream
  [changelog](https://github.com/denisfl/micra.js/blob/master/CHANGELOG.md#230--2026-05-30)
  for the full release notes.
- No gem-side API changes — existing `micra_component`, `micra_includes`,
  and `micra_state` helpers work unchanged against the new release.
- Bumping is a pin-only change for most consumers; pre-existing apps
  using `bin/importmap pin micra --download` should re-run that command
  to pull the new vendor bundle.

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

[0.3.0]: https://github.com/denisfl/micra-rails/compare/v0.2.0...v0.3.0
[0.2.0]: https://github.com/denisfl/micra-rails/compare/v0.1.0...v0.2.0
[0.1.0]: https://github.com/denisfl/micra-rails/releases/tag/v0.1.0
