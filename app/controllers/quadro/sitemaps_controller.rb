require_dependency 'quadro/application_controller'

module Quadro
  class SitemapsController < ApplicationController
    before_filter :authenticate_user!

    respond_to :js, :json, :xml

    def ping
      notifier.run(sitemap_url)
      flash[:notice] = t('quadro.flash.notified')
    end
  end
end
