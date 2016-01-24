module Quadro
  module NavigationHelper
    def navigation_for(node, *args)
      return "" unless node

      options = args[0] || {}

      content_tag :ul, class: options[:class] do
        unless node.is_childless?
          node.children.each do |child|
            css_class = "active" if page.path_ids.include?(child.id)
            if child.has_children?
              concat dropdown_for child, class: 'dropdown'
            else
              concat content_tag :li, content_tag(:a, child.title, href: page_path(child)), class: css_class
            end
          end
        end
      end.html_safe
    end

    def dropdown_for(node, *args)
      return "" unless node

      options = args[0] || {}

      content_tag :li, class: options[:class] do
        concat(content_tag :a, (node.title + tag(:span, class: 'caret')).html_safe, class: 'dropdown', href: page_path(node))
        concat(content_tag(:ul, class: 'dropdown-menu') do
          node.children.each do |child|
            css_class = "active" if page.path_ids.include?(child.id)
            if child.has_children?
              concat dropdown_for child, class: 'dropdown'
            else
              concat(content_tag(:li, content_tag(:a, child.title, href: page_path(child)), class: css_class))
            end
          end
        end)
      end
    end
  end
end
