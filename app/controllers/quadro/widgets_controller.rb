require_dependency "quadro/application_controller"

module Quadro
  class WidgetsController < ApplicationController
    before_filter :authenticate_user!

    respond_to :json, :xml

    def create
      respond_with widget, location: page_widgets_path
    end

    def update
      widget.update_attributes(params[:widget])
      respond_with widget, location: page_widgets_path
    end

    def destroy
      widget.destroy
    end
  end
end
