module Quadro
  class Widget::Slider < Widget
    # attributes
    store :settings, accessors: [:width, :height]

    # associations
    has_many :slides, as: :assetable, class_name: Quadro::Asset::Slide

    # methods
    class << self
      def short_name
        'slider'
      end
    end
  end
end
