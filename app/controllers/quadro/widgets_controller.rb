require_dependency 'quadro/application_controller'

module Quadro
  class WidgetsController < ApplicationController
    before_filter :authenticate_user!

    respond_to :js, :json, :xml

    def update
      if widget.update_attributes(params[:widget])
        flash[:notice] = t('flash.updated')
      else
        flash[:alert] = t('flash.not_updated')
      end

      respond_with widget
    end
  end
end
