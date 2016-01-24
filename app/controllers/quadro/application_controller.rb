module Quadro
  class ApplicationController < ActionController::Base
    helper_method :widget, :asset, :root, :parent, :page, :subpages

    def after_sign_in_path_for(resource)
      quadro.root_path
    end

    def after_sign_out_path_for(resource)
      quadro.root_path
    end

    private

    def widget
      @widget =
        case
        when ["widgets"].include?(controller_name) && ["create"].include?(action_name)
          widget_type = params[:type].constantize
          new_widget = widget_type.new(params[:widget])
          page.widgets << new_widget
          new_widget
        when ["assets"].include?(controller_name)
          new_widget = page.widgets.find(params[:widget_id]) rescue nil
          new_widget.becomes(new_widget.type.constantize) unless new_widget.nil?
        else
          new_widget = page.widgets.find(params[:id]) rescue nil
          new_widget.becomes(new_widget.type.constantize) unless new_widget.nil?
        end
    end

    def asset
     @asset ||=
        case
        when ["assets"].include?(controller_name) && ["create"].include?(action_name)
          new_asset = params[:type].constantize.new(params[:asset])
          if widget.present?
            widget.assets << new_asset
          elsif page.present?
            page.assets << new_asset
          end
          new_asset
        when ["assets"].include?(controller_name) && ["edit", "update", "destroy"].include?(action_name)
          if widget.present?
            new_asset = widget.assets.find(params[:id]) rescue nil
            new_asset.becomes(new_asset.type.constantize) unless new_asset.nil?
          else
            new_asset = page.assets.find(params[:id]) rescue nil
            new_asset.becomes(new_asset.type.constantize) unless new_asset.nil?
          end
        else
          new_asset = page.assets.find(params[:id]) rescue nil
          new_asset.becomes(new_asset.type.constantize) unless new_asset.nil?
        end
    end

    def root
      @root ||= Quadro::Page.roots.first rescue nil
    end

    def parent
      @parent ||= Quadro::Page.find(params[:parent_id]) rescue nil
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
        else
          root.subtree.find(params[:page_id]) rescue nil
        end
    end

    def subpages
      @subpages ||= page.children.page(params[:page])
    end
  end
end
