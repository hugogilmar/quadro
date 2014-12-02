module Quadro
  module WidgetsHelper
    def widget_for(name, *args, &block)
      return "" unless name

      widget = widgets.select{ |w| w.name == name.to_s }.first || Quadro::Widget::Html.new(name: name)
      options = args[0] || {}
      options.merge!({id: widget.id, type: widget.type, name: name, page: (widget.page_id ? widget.page_id : page.id) }).reject!{ |k, v| v.nil? }

      if block_given?
        content_tag :div, class: 'summernote', data: options do
          if widget.content.blank?
            capture(&block).html_safe
          else
            widget.content.html_safe
          end
        end
      else
        content_tag :div, class: 'summernote', data: options do
          widget.content.html_safe unless widget.content.blank?
        end
      end
    end
  end
end
