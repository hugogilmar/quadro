module Quadro
  class Widget::Video < Widget
    # attributes
    store :settings, accessors: [:width, :height]

    # methods
    class << self
      def short_name
        'video'
      end
    end
  end
end
