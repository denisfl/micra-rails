# frozen_string_literal: true

# Default importmap pin. Override by re-pinning in your own config/importmap.rb.
pin "micra",
    to: "https://cdn.jsdelivr.net/npm/micra.js@#{Micra::Rails::MICRA_JS_VERSION}/dist/micra.esm.js",
    preload: true
