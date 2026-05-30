# frozen_string_literal: true

module Micra
  module Rails
    VERSION = "0.3.0"

    # Tracks the Micra.js npm version we ship by default. The importmap pin
    # uses this value. Bump it together with VERSION when wrapping a new
    # upstream release.
    MICRA_JS_VERSION = "2.3.0"
  end
end
