module Quadro
  class Widget::Html < Widget
    # attributes
    attr_accessible :content
    store :settings, accessors: [:width, :height]

    # methods
    class << self
      def short_name
        'html'
      end
    end
  end
end
