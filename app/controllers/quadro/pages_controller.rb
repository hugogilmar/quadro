require_dependency 'quadro/application_controller'

module Quadro
  class PagesController < ApplicationController
    before_filter :authenticate_user!, except: [:index, :show, :form]
    before_filter :prepare_breadcrumbs

    respond_to :html, :js

    def create
      page.save
    end

    def update
      page.update_attributes(params[:page])
    end

    def destroy
      page.destroy unless page.is_root?
    end

    def form
      interaction.ip_address = request.remote_ip
      interaction.user_agent = request.user_agent
      interaction.update_attributes(content: params[:form])
    end

    private

    def prepare_breadcrumbs
      page.path.each do |path|
        page.id == path.id ? add_crumb(path.title) : add_crumb(path.title, page_path(path))
      end
    end
  end
end
