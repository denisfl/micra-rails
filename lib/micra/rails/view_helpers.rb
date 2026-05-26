# frozen_string_literal: true

module Micra
  module Rails
    # View helpers for Micra.js components.
    #
    #   <%= micra_component :counter, count: 0 do %>
    #     <button @click="dec">−</button>
    #     <strong data-text="count"></strong>
    #     <button @click="inc">+</button>
    #   <% end %>
    #
    # Produces:
    #
    #   <div data-component="counter" data-count="0">
    #     <button @click="dec">−</button>
    #     <strong data-text="count"></strong>
    #     <button @click="inc">+</button>
    #   </div>
    module ViewHelpers
      # Renders a wrapper <%= tag %> with `data-component="<name>"` and
      # `data-<key>="<value>"` for each prop. Non-string values are JSON-encoded
      # so they round-trip via this.prop() in Micra.
      def micra_component(name, tag: :div, **props, &block)
        attributes = {"data-component" => name.to_s}

        props.each do |key, value|
          attributes["data-#{key.to_s.dasherize}"] = serialize_prop(value)
        end

        content_tag(tag, capture(&block), attributes)
      end

      # Drop into your application layout once. Outputs the importmap module
      # script that boots Micra and a final <script>Micra.start()</script>.
      def micra_includes
        capture do
          concat javascript_importmap_tags
          concat javascript_tag(<<~JS, type: "module")
            import * as Micra from "micra"
            window.Micra = Micra
            document.addEventListener("DOMContentLoaded", () => Micra.start())
          JS
        end
      end

      # Inline JSON props for a single component instance.
      #
      #   <%= micra_state user: @user.as_json %>
      #
      # Equivalent to writing data-user='{"id":1,...}' yourself.
      def micra_state(**props)
        props.map { |k, v| ["data-#{k.to_s.dasherize}", serialize_prop(v)] }.to_h
      end

      private

      def serialize_prop(value)
        case value
        when String, Symbol, Numeric, TrueClass, FalseClass, NilClass
          value.to_s
        else
          value.to_json
        end
      end
    end
  end
end
