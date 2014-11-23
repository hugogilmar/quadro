module Quadro
  module WidgetsHelper
    def widget_for(name, *args, &block)
      if block_given?
        options = args[0] || { airmode: false }
        content_tag :div, class: 'summernote', data: options do
          capture(&block).html_safe
        end
      else
        ""
      end
    end
  end
end
