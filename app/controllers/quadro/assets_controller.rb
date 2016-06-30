require_dependency 'quadro/application_controller'

module Quadro
  class AssetsController < ApplicationController
    before_filter :authenticate_user!

    respond_to :js, :json, :xml

    def create
      if asset.save
        flash[:notice] = t('quadro.flash.created')
      else
        flash[:alert] = t('quadro.flash.not_created')
      end
    end

    def update
      if asset.update_attributes(params[:asset])
        flash[:notice] = t('quadro.flash.updated')
      else
        flash[:alert] = t('quadro.flash.not_updated')
      end
    end

    def destroy
      if asset.destroy
        flash[:notice] = t('quadro.flash.deleted')
      else
        flash[:alert] = t('quadro.flash.not_deleted')
      end
    end
  end
end
