# frozen_string_literal: true

require "test_helper"

class VersionTest < Minitest::Test
  def test_version_is_a_string
    refute_nil Micra::Rails::VERSION
    assert_match(/\A\d+\.\d+\.\d+\z/, Micra::Rails::VERSION)
  end

  def test_micra_js_version_tracked
    refute_nil Micra::Rails::MICRA_JS_VERSION
    assert_match(/\A\d+\.\d+\.\d+\z/, Micra::Rails::MICRA_JS_VERSION)
  end

  def test_pin_targets_the_major_range_of_the_tracked_version
    major = Micra::Rails::MICRA_JS_VERSION.split(".").first
    assert_equal "https://cdn.jsdelivr.net/npm/micra.js@#{major}/dist/micra.esm.js",
      Micra::Rails::MICRA_JS_PIN
  end
end
