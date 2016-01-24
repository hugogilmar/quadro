module Quadro
  class ApplicationController < ActionController::Base
    helper_method :widgets, :widget, :root, :parent, :page, :subpages

    def after_sign_in_path_for(resource)
      quadro.root_path
    end

    def after_sign_out_path_for(resource)
      quadro.root_path
    end

    private

    def widgets
      @widgets ||= page.widgets
    end

    def widget
      @widget =
        case
        when ["widgets"].include?(controller_name) && ["create"].include?(action_name)
          widget_type = params[:type].constantize
          new_widget = widget_type.new(params[:widget])
          page.widgets << new_widget
          new_widget
        when ["assets"].include?(controller_name)
          page.widgets.find(params[:widget_id]) rescue nil
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
        when ["assets"].include?(controller_name) && ["create"].include?(action_name)
          asset_type = params[:type].constantize
          new_asset = asset_type.new(params[:asset])
          if widget.present?
            widget.assets << new_asset
          elsif page.present?
            page.assets << new_asset
          end
          new_asset
        when ["assets"].include?(controller_name) && ["update", "destroy"].include?(action_name)
          new_asset = widget.assets.find(params[:id]).becomes(widget.type.constantize)
        else
          page.assets.find(params[:id]).becomes(widget.type.constantize)
        end
    end

    def root
      @root ||= Quadro::Page.roots.first
    end

    def parent
      @parent ||= Quadro::Page.find(params[:parent_id])
    end

    def page
      @page ||=
        case
        when ["pages"].include?(controller_name)
          case
          when ["index"].include?(action_name)
            root
          when ["new"].include?(action_name)
            parent.children.new
          when ["create"].include?(action_name)
            parent.children.new(params[:page])
          when ["edit", "update"].include?(action_name)
            root.subtree.find_by_slug(params[:id]) rescue nil
          else
            root.subtree.find_by_slug(params[:id]) rescue nil
          end
        when ["widgets", "assets"].include?(controller_name)
          root.subtree.find(params[:page_id]) rescue nil
        end
    end

    def subpages
      @subpages ||= page.children.page(params[:page])
    end
  end
end
