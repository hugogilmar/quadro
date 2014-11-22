module Quadro
  class Widget::Html < Widget
    # attributes
    attr_accessible :content
    store :settings, accessors: [:width, :height]
  end
end
