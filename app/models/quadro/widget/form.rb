module Quadro
  class Widget::Form < Widget
    # attributes
    store :settings, accessors: [:width, :height]

    # methods
    class << self
      def short_name
        'form'
      end
    end
  end
end
