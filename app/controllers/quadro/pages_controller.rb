require_dependency 'quadro/application_controller'

module Quadro
  class PagesController < ApplicationController
    before_filter :authenticate_user!, except: [:index, :show]
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

    private

    def prepare_breadcrumbs
      page.path.each do |path|
        page.id == path.id ? add_crumb(path.title) : add_crumb(path.title, page_path(path))
      end
    end
  end
end
