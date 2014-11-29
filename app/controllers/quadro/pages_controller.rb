require_dependency "quadro/application_controller"

module Quadro
  class PagesController < ApplicationController
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
  end
end
