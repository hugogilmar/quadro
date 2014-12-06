require_dependency "quadro/application_controller"

module Quadro
  class AssetsController < ApplicationController
    respond_to :js, :json, :xml

    def create
      asset.save
      respond_with asset, location: page_assets_path
    end

    def update
      asset.update_attributes(params[:asset])
      respond_with asset, location: page_assets_path
    end

    def destroy
      asset.destroy
    end
  end
end
