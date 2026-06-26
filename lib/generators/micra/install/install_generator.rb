# frozen_string_literal: true

require "rails/generators/base"

module Micra
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      desc "Installs Micra.js: pins via importmap and inserts <%= micra_includes %> into the application layout."

      source_root File.expand_path("templates", __dir__)

      def pin_micra_in_importmap
        return unless File.exist?("config/importmap.rb")

        line = %(pin "micra", to: "#{Micra::Rails::MICRA_JS_PIN}", preload: true\n)

        append_to_file "config/importmap.rb" do
          "\n# Micra.js — reactive UI directives (<5 KB gzip)\n#{line}"
        end
      end

      def inject_includes_in_layout
        layout = "app/views/layouts/application.html.erb"
        return unless File.exist?(layout)

        unless File.read(layout).include?("micra_includes")
          inject_into_file layout,
            "    <%= micra_includes %>\n",
            before: "  </head>\n"
        end
      end

      def show_done_message
        say ""
        say "✔ Micra.js installed."
        say ""
        say "  Try it in any view:"
        say ""
        say %(    <%= micra_component :counter, count: 0 do %>)
        say %(      <button @click="dec">−</button>)
        say %(      <strong data-text="count"></strong>)
        say %(      <button @click="inc">+</button>)
        say %(    <% end %>)
        say ""
        say %(  Then in JS (app/javascript/application.js or similar):)
        say ""
        say %(    import * as Micra from "micra")
        say %(    Micra.define("counter", {)
        say %(      state: { count: 0 },)
        say %(      inc() { this.state.count++ },)
        say %(      dec() { this.state.count-- },)
        say %(    }))
        say ""
        say "  Docs: https://denisfl.github.io/micra.js/"
        say ""
      end
    end
  end
end
