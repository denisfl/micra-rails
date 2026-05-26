# frozen_string_literal: true

require "rails"
require "importmap-rails"

require "micra/rails/version"
require "micra/rails/engine"

module Micra
  module Rails
    # Convenience accessor used by ViewHelpers and the install generator.
    # In production you may want to vendor the minified file instead of
    # hitting jsDelivr — flip `Micra::Rails.vendored = true` and put the
    # file at `app/assets/javascripts/micra.min.js`.
    class << self
      attr_accessor :vendored
    end

    self.vendored = false
  end
end
