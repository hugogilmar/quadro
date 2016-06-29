require_dependency 'quadro/application_controller'

module Quadro
  class AssetsController < ApplicationController
    before_filter :authenticate_user!

    respond_to :js, :json, :xml

    def create
      if asset.save
        flash[:notice] = t('flash.created')
      else
        flash[:alert] = t('flash.not_created')
      end
    end

    def update
      if asset.update_attributes(params[:asset])
        flash[:notice] = t('flash.updated')
      else
        flash[:alert] = t('flash.not_updated')
      end
    end

    def destroy
      if asset.destroy
        flash[:notice] = t('flash.deleted')
      else
        flash[:alert] = t('flash.not_deleted')
      end
    end
  end
end
