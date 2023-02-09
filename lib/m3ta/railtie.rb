# frozen_string_literal: true

module M3ta
  class Railtie < ::Rails::Railtie
    initializer 'm3ta.action_controller' do
      ActiveSupport.on_load(:action_controller) do
        include M3ta::Controller
      end
    end

    initializer 'm3ta.action_view' do
      ActiveSupport.on_load(:action_view) do
        include M3ta::Helpers
      end
    end
  end
end
