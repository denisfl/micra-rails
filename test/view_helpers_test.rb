# frozen_string_literal: true

require "test_helper"
require "micra/rails/view_helpers"

class ViewHelpersTest < Minitest::Test
  include Micra::Rails::ViewHelpers
  include ActionView::Helpers::TagHelper
  include ActionView::Helpers::CaptureHelper

  attr_accessor :output_buffer

  def test_micra_component_with_primitives
    html = micra_component(:counter, count: 0, label: "Tasks") { "" }
    assert_includes html, %(data-component="counter")
    assert_includes html, %(data-count="0")
    assert_includes html, %(data-label="Tasks")
  end

  def test_micra_component_serializes_complex_props_as_json
    html = micra_component(:user_card, user: {id: 1, name: "Ada"}) { "" }
    assert_includes html, %(data-user="{&quot;id&quot;:1,&quot;name&quot;:&quot;Ada&quot;}")
  end

  def test_micra_state_returns_attribute_hash
    attrs = micra_state(count: 0, tags: %w[a b])
    assert_equal "0", attrs["data-count"]
    assert_equal %(["a","b"]), attrs["data-tags"]
  end

  def test_dasherizes_keys
    html = micra_component(:demo, current_user_id: 42) { "" }
    assert_includes html, %(data-current-user-id="42")
  end
end
