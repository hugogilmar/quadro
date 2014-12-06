module Quadro
  class ApplicationController < ActionController::Base
    helper_method :widgets, :widget, :root, :page

    private

    def widgets
      @widgets ||= page.widgets
    end

    def widget
      @widget ||=
        case
        when ["create"].include?(action_name)
          widget_type = params[:type].constantize
          new_widget = widget_type.new(params[:widget])
          page.widgets << new_widget
          new_widget
        else
          page.widgets.find(params[:id]) rescue nil
        end
    end

    def assets
      @assets ||= page.assets
    end

    def asset
     @asset ||=
        case
        when ["create"].include?(action_name)
          asset_type = params[:type].constantize
          new_asset = asset_type.new(params[:asset])
          page.assets << new_asset
          new_asset
        else
          page.assets.find(params[:id]) rescue nil
        end
    end

    def root
      Quadro::Page.roots.first
    end

    def page
      @page ||=
        case
        when ["pages"].include?(controller_name)
          case
          when ["index"].include?(action_name)
            root
          when ["new"].include?(action_name)
            root.children.new
          when ["create"].include?(action_name)
            root.children.new(params[:page])
          when ["edit", "update"].include?(action_name)
            if params["is_root"]
              root
            else
              root.children.find_by_slug(params[:id]) rescue nil
            end
          else
            root.children.find_by_slug(params[:id]) rescue nil
          end
        when ["widgets", "assets"].include?(controller_name)
          root.subtree.find(params[:page_id]) rescue nil
        end
    end
  end
end
