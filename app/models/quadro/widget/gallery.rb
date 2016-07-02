module Quadro
  class Widget::Gallery < Widget
    # attributes
    store :settings, accessors: [:width, :height]

    # associations
    has_many :images, as: :assetable, class_name: Quadro::Asset::Image

    # methods
    class << self
      def short_name
        'gallery'
      end
    end
  end
end
