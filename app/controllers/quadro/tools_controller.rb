require_dependency 'quadro/application_controller'

module Quadro
  class ToolsController < ApplicationController
    before_filter :authenticate_user!

    respond_to :js, :json, :xml

    def sitemap_notifier
      notifier.run(sitemap_url)
      flash[:notice] = t('quadro.flash.notified')
    end
  end
end
