# frozen_string_literal: true

module Micra
  module Rails
    # Mountable engine: registers the importmap pin and the view helpers.
    class Engine < ::Rails::Engine
      isolate_namespace Micra::Rails

      initializer "micra.rails.importmap", before: "importmap" do |app|
        next unless app.config.respond_to?(:importmap)

        app.config.importmap.paths << root.join("config/importmap.rb")
      end

      initializer "micra.rails.helpers" do
        ActiveSupport.on_load(:action_view) do
          require "micra/rails/view_helpers"
          include Micra::Rails::ViewHelpers
        end
      end
    end
  end
end
