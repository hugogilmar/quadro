module Quadro
  class Widget::Map < Widget
    # attributes
    store :settings, accessors: [:width, :height]

    # methods
    class << self
      def short_name
        'map'
      end
    end
  end
end
