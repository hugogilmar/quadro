require_dependency 'quadro/application_controller'

module Quadro
  class PagesController < ApplicationController
    before_filter :authenticate_user!, except: [:index, :show, :form]
    before_filter :page_exists?
    before_filter :prepare_breadcrumbs

    respond_to :html, :js

    def create
      page.author = current_user
      if page.save
        flash[:notice] = t('quadro.flash.created')
      else
        flash[:alert] = t('quadro.flash.not_created')
      end
    end

    def update
      if page.update_attributes(page_params)
        flash[:notice] = t('quadro.flash.updated')
      else
        flash[:alert] = t('quadro.flash.not_updated')
      end
    end

    def destroy
      unless page.is_root?
        if page.destroy
          flash[:notice] = t('quadro.flash.deleted')
        else
          flash[:alert] = t('quadro.flash.not_deleted')
        end
      else
        flash[:alert] = t('quadro.flash.could_not_be_deleted')
      end
    end

    def form
      interaction.ip_address = request.remote_ip
      interaction.user_agent = request.user_agent
      interaction.content = params[:form]
      if interaction.save
        flash[:notice] = t('quadro.flash.created')
      else
        flash[:alert] = t('quadro.flash.not_created')
      end
    end

    def publish
      if page.publish!
        flash[:notice] = t('quadro.flash.published')
      else
        flash[:alert] = t('quadro.flash.not_published')
      end
    end

    def unpublish
      if page.unpublish!
        flash[:notice] = t('quadro.flash.unpublished')
      else
        flash[:alert] = t('quadro.flash.not_unpublished')
      end
    end

    private

    def page_exists?
      not_found_page and return if page.nil?
    end

    def prepare_breadcrumbs
      page.path.each do |path|
        page.id == path.id ? add_crumb(path.title) : add_crumb(path.title, page_path(path))
      end
    end
  end
end
