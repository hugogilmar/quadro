require_dependency 'quadro/application_controller'

module Quadro
  class AssetsController < ApplicationController
    before_filter :authenticate_user!

    respond_to :js, :json, :xml

    def create
      asset.save
    end

    def update
      asset.update_attributes(params[:asset])
    end

    def destroy
      asset.destroy
    end
  end
end
