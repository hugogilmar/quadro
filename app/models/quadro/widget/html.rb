module Quadro
  class Widget::Html < Widget
    # attributes
    store :settings, accessors: [:width, :height]

    # methods
    class << self
      def short_name
        'html'
      end
    end
  end
end
