module Quadro
  module WidgetHelper
    def widget_for(name, *args, &block)
      return "" unless name

      options = args[0] || {}

      new_widget =
        case options[:type]
        when :html
          page.widgets.select{ |w| w.name == name.to_s && w.type == Quadro::Widget::Html.to_s }.first || page.widgets.create(name: name, type: Quadro::Widget::Html.to_s).becomes(Quadro::Widget::Html)
        when :slider
          page.widgets.select{ |w| w.name == name.to_s && w.type == Quadro::Widget::Slider.to_s }.first || page.widgets.create(name: name, type: Quadro::Widget::Slider.to_s).becomes(Quadro::Widget::Slider)
        when :gallery
          page.widgets.select{ |w| w.name == name.to_s && w.type == Quadro::Widget::Gallery.to_s }.first || page.widgets.create(name: name, type: Quadro::Widget::Gallery.to_s).becomes(Quadro::Widget::Gallery)
        when :map
          page.widgets.select{ |w| w.name == name.to_s && w.type == Quadro::Widget::Map.to_s }.first || page.widgets.create(name: name, type: Quadro::Widget::Map.to_s).becomes(Quadro::Widget::Map)
        else
          page.widgets.select{ |w| w.name == name.to_s && w.type == Quadro::Widget::Html.to_s }.first || page.widgets.create(name: name, type: Quadro::Widget::Html.to_s)
        end

      widget_block(new_widget, options, (block_given? ? capture(&block) : nil))
    end

    def widget_block(widget, options, content=nil)
      widget_type = widget.type.constantize.short_name
      if user_signed_in?
        options.merge!({ id: widget.id, type: widget.type, name: widget.name, page: widget.page_id, path: page_widget_path(page_id: widget.page_id, id: widget.id) }).reject!{ |k, v| v.nil? }
        render("quadro/widgets/#{widget_type}/signed_on", widget: widget, options: options, content: content)
      else
        render("quadro/widgets/#{widget_type}/signed_off", widget: widget, options: options, content: content)
      end
    end
  end
end
