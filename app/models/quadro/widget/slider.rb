module Quadro
  class Widget::Slider < Widget
    # attributes
    attr_accessible :content
    store :settings, accessors: [:width, :height]

    # associations
    has_many :assets, as: :assetable, dependent: :destroy
    has_many :slides, as: :assetable, class_name: Quadro::Asset::Slide

    class << self
      def short_name
        'slider'
      end
    end
  end
end
