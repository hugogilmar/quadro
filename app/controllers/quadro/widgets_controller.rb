require_dependency "quadro/application_controller"

module Quadro
  class WidgetsController < ApplicationController
    respond_to :json, :xml

    def index
      respond_with widgets
    end

    def show
      respond_with widget
    end

    def create
      widget.save
      respond_with widget, location: widgets_path
    end

    def update
      widget.update_attributes(params[:widget])
      respond_with widget, location: widgets_path
    end

    def destroy
      widget.destroy
    end
  end
end
