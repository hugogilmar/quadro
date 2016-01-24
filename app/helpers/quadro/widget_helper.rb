module Quadro
  module WidgetHelper
    def widget_for(name, *args, &block)
      return "" unless name

      options = args[0] || {}

      _widget = case options[:type]
      when :html
        widgets.select{ |w| w.name == name.to_s && w.type == Quadro::Widget::Html.to_s }.first || page.widgets.create(name: name, type: Quadro::Widget::Html.to_s).becomes(Quadro::Widget::Html)
      when :slider
        widgets.select{ |w| w.name == name.to_s && w.type == Quadro::Widget::Slider.to_s }.first || page.widgets.create(name: name, type: Quadro::Widget::Slider.to_s).becomes(Quadro::Widget::Slider)
      else
        widgets.select{ |w| w.name == name.to_s && w.type == Quadro::Widget::Html.to_s }.first || page.widgets.create(name: name, type: Quadro::Widget::Html.to_s).becomes(Quadro::Widget::Html)
      end

      widget_block(_widget, options, (block_given? ? capture(&block) : nil))
    end

    def widget_block widget, options, content=nil
      widget_type = widget.type.constantize.short_name
      if user_signed_in?
        options.merge!({id: widget.id, type: widget.type, name: widget.name, page: widget.page_id, path: page_widget_path(page_id: widget.page_id, id: widget.id)}).reject!{ |k, v| v.nil? }
        render("quadro/widgets/#{widget_type}/signed_on", widget: widget, options: options, content: content)
      else
        render("quadro/widgets/#{widget_type}/signed_off", widget: widget, options: options, content: content)
      end
    end
  end
end
