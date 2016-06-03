module Quadro
  class Engine < ::Rails::Engine
    isolate_namespace Quadro

    config.to_prepare do
      Devise::SessionsController.layout "quadro/devise"
      Devise::RegistrationsController.layout "quadro/devise"
      Devise::ConfirmationsController.layout "quadro/devise"
      Devise::UnlocksController.layout "quadro/devise"
      Devise::PasswordsController.layout "quadro/devise"
    end

    config.after_initialize do
      Quadro.available_widgets << Quadro::Widget::Html.to_s
      Quadro.available_widgets << Quadro::Widget::Slider.to_s
      Quadro.available_widgets << Quadro::Widget::Gallery.to_s
      Quadro.available_widgets << Quadro::Widget::Map.to_s

      Quadro.available_assets << Quadro::Asset::Cover.to_s
      Quadro.available_assets << Quadro::Asset::Slide.to_s
      Quadro.available_assets << Quadro::Asset::Image.to_s

      Quadro.vars[:host] = Figaro.env.host
      Quadro.vars[:email] = Figaro.env.email
      Quadro.vars[:site] = Figaro.env.site
      Quadro.vars[:author] = Figaro.env.author
      Quadro.vars[:layout] = Figaro.env.layout
      Quadro.vars[:template] = Figaro.env.template
      Quadro.vars[:frequency] = Figaro.env.frequency
      Quadro.vars[:priority] = Figaro.env.priority
      Quadro.vars[:google_maps_api_key] = Figaro.env.google_maps_api_key
    end
  end
end
