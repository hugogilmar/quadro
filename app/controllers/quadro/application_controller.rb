module Quadro
  class ApplicationController < ActionController::Base
    after_filter :prepare_unobtrusive_flash
    helper_method :widget, :asset, :interaction, :root, :parent, :page, :subpages, :geoip, :video, :user, :users

    def after_sign_in_path_for(_resource)
      quadro.root_path
    end

    def after_sign_out_path_for(_resource)
      quadro.root_path
    end

    private

    def widget
      @widget ||=
        case
        when %w(widgets).include?(controller_name) && %w(create).include?(action_name)
          widget_type = params[:type]
          if Quadro.available_widgets.include?(widget_type)
            klass = widget_type.constantize
            new_widget = klass.new(params[:widget])
            page.widgets << new_widget
            new_widget
          end
        when %w(pages).include?(controller_name) && %w(form).include?(action_name)
          new_widget = page.widgets.find(params[:widget_id]) rescue nil
          new_widget.becomes(new_widget.type.constantize) unless new_widget.nil?
          new_widget
        when %w(assets).include?(controller_name)
          new_widget = page.widgets.find(params[:widget_id]) rescue nil
          new_widget.becomes(new_widget.type.constantize) unless new_widget.nil?
          new_widget
        else
          new_widget = page.widgets.find(params[:id]) rescue nil
          new_widget.becomes(new_widget.type.constantize) unless new_widget.nil?
          new_widget
        end
    end

    def asset
      @asset ||=
        case
        when %w(assets).include?(controller_name) && %w(create).include?(action_name)
          asset_type = params[:type]
          if Quadro.available_assets.include?(asset_type)
            klass = asset_type.constantize
            new_asset = klass.new(asset_params)
            if widget.present?
              widget.assets << new_asset
            elsif page.present?
              page.assets << new_asset
            end
            new_asset
          end
        when %w(assets).include?(controller_name) && %w(edit update destroy).include?(action_name)
          if widget.present?
            widget.find_asset(params[:id])
          elsif page.present?
            page.find_asset(params[:id])
          end
        else
          page.find_asset(params[:id])
        end
    end

    def interaction
      @interaction ||= widget.interactions.new
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
        when %w(pages).include?(controller_name)
          case
          when %w(index).include?(action_name)
            root
          when %w(new).include?(action_name)
            parent.children.new
          when %w(create).include?(action_name)
            parent.children.new(page_params)
          when %w(edit update form publish unpublish).include?(action_name)
            root.subtree.find_by_slug(params[:id]) rescue nil
          else
            if user_signed_in?
              root.subtree.find_by_slug(params[:id]) rescue nil
            else
              root.subtree.published.find_by_slug(params[:id]) rescue nil
            end
          end
        when %w(widgets assets).include?(controller_name)
          root.subtree.find(params[:page_id]) rescue nil
        else
          root.subtree.find(params[:page_id]) rescue nil
        end
    end

    def subpages
      if user_signed_in?
        @subpages ||= page.children.ordered.page(params[:page]).per(1)
      else
        @subpages ||= page.children.published.ordered.page(params[:page]).per(1)
      end
    end

    def geoip
      @geoip ||= MaxMindDB.new(File.join(Rails.root, 'db', 'GeoLite2-Country.mmdb'))
    end

    def notifier
      @notifier ||= SitemapNotifier::Notifier
    end

    def video
      @video ||= VideoInfo
    end

    def user
      @user ||= current_user
    end

    def users
      @users ||= Quadro::User.ordered
    end

    def not_found_page
      render file: 'public/404', status: :not_found, layout: false
    end

    private

    def page_params
      params.require(:page).permit(:title, :summary, :template, :frequency, :priority, :cover_attributes, :author_id, :published_at)
    end

    def widget_params
      params.require(:widget).permit(:name, :type, :content, :width, :height)
    end

    def asset_params
      params.require(:asset).permit(:attachment, :width, :height, :alt, :href)
    end

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :remember_me, :name)
    end
  end
end
