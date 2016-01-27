module Quadro
  class Engine < ::Rails::Engine
    isolate_namespace Quadro

    config.to_prepare do
      Devise::SessionsController.layout "quadro/application"
    end

    config.after_initialize do
      Quadro.available_widgets << Quadro::Widget::Html.to_s
      Quadro.available_widgets << Quadro::Widget::Slider.to_s

      Quadro.available_assets << Quadro::Asset::Image.to_s
      Quadro.available_assets << Quadro::Asset::Cover.to_s
      Quadro.available_assets << Quadro::Asset::Slide.to_s
    end
  end
end
