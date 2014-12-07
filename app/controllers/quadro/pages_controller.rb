require_dependency "quadro/application_controller"

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
      page.destroy
    end

    private

    def prepare_breadcrumbs
      add_crumb "Home", root_path
      add_crumb page if ["show"].include?(action_name)
    end
  end
end
