module Quadro
  class Engine < ::Rails::Engine
    isolate_namespace Quadro
    config.to_prepare do
      Devise::SessionsController.layout "quadro/application"
    end
  end
end
