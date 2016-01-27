require_dependency 'quadro/application_controller'

module Quadro
  class WidgetsController < ApplicationController
    before_filter :authenticate_user!

    respond_to :js, :json, :xml

    def update
      widget.update_attributes(params[:widget])
      respond_with widget
    end
  end
end
