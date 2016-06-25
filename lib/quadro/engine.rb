module Quadro
  class Engine < ::Rails::Engine
    isolate_namespace Quadro

    config.before_configuration do
      Quadro.setup do |config|
        config.host = "www.example.com"
        config.email = "quadro@example.com"
        config.site = "Quadro"
        config.layout = "list"
        config.template = "blank"
        config.frequency = "monthly"
        config.priority = "0.5"
        config.google_maps_api_key = ""
        config.facebook_id = ""
        config.twitter_username = ""
      end
    end

    config.to_prepare do
      Devise::SessionsController.layout "quadro/devise"
      Devise::RegistrationsController.layout "quadro/devise"
      Devise::ConfirmationsController.layout "quadro/devise"
      Devise::UnlocksController.layout "quadro/devise"
      Devise::PasswordsController.layout "quadro/devise"
    end

    config.after_initialize do
      Quadro.available_widgets = [
        Quadro::Widget::Html.to_s,
        Quadro::Widget::Slider.to_s,
        Quadro::Widget::Gallery.to_s,
        Quadro::Widget::Map.to_s,
        Quadro::Widget::Form.to_s,
        Quadro::Widget::Video.to_s
      ]

      Quadro.available_assets = [
        Quadro::Asset::Cover.to_s,
        Quadro::Asset::Slide.to_s,
        Quadro::Asset::Image.to_s
      ]
    end
  end
end
