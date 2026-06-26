# frozen_string_literal: true

module Micra
  module Rails
    VERSION = "0.4.0"

    # The upstream Micra.js release this gem is built and tested against. Bump it
    # when wrapping a new upstream release.
    MICRA_JS_VERSION = "2.7.0"

    # The default importmap pin. It tracks the MAJOR range (e.g. `@2`), not a single
    # patch — apps pick up Micra 2.x patches and minors automatically with no gem
    # bump, and it won't jump a breaking major. Override by re-pinning a specific
    # version in your own config/importmap.rb.
    MICRA_JS_PIN =
      "https://cdn.jsdelivr.net/npm/micra.js@#{MICRA_JS_VERSION.split(".").first}/dist/micra.esm.js"
  end
end
