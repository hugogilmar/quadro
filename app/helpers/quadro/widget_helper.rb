module Quadro
  module WidgetHelper
    def widget_for(name, *args, &block)
      return "" unless name

      options = args.extract_options!

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
        when :form
          page.widgets.select{ |w| w.name == name.to_s && w.type == Quadro::Widget::Form.to_s }.first || page.widgets.create(name: name, type: Quadro::Widget::Form.to_s).becomes(Quadro::Widget::Form)
        when :video
          page.widgets.select{ |w| w.name == name.to_s && w.type == Quadro::Widget::Video.to_s }.first || page.widgets.create(name: name, type: Quadro::Widget::Video.to_s).becomes(Quadro::Widget::Video)
        else
          page.widgets.select{ |w| w.name == name.to_s && w.type == Quadro::Widget::Html.to_s }.first || page.widgets.create(name: name, type: Quadro::Widget::Html.to_s)
        end

      widget_block(new_widget, options, &block)
    end

    def widget_block(widget, options, &block)
      return "" unless widget

      widget_type = widget.type.constantize.short_name

      case widget_type
      when 'form'
        simple_form_for(widget.name, url: form_page_path(widget.page), remote: true, html: { id: widget.name }) do |form|
          content = block_given? ? capture(form, &block) : nil
          if user_signed_in?
            options.merge!({ id: widget.id, type: widget.type, name: widget.name, page: widget.page_id, path: page_widget_path(page_id: widget.page_id, id: widget.id) }).reject!{ |k, v| v.nil? }
            render("quadro/widgets/#{widget_type}/signed_on", widget: widget, options: options, content: content, form: form)
          else
            render("quadro/widgets/#{widget_type}/signed_off", widget: widget, options: options, content: content, form: form)
          end
        end
      else
        content = block_given? ? capture(&block) : nil
        if user_signed_in?
          options.merge!({ id: widget.id, type: widget.type, name: widget.name, page: widget.page_id, path: page_widget_path(page_id: widget.page_id, id: widget.id) }).reject!{ |k, v| v.nil? }
          render("quadro/widgets/#{widget_type}/signed_on", widget: widget, options: options, content: content)
        else
          render("quadro/widgets/#{widget_type}/signed_off", widget: widget, options: options, content: content)
        end
      end
    end
  end
end
