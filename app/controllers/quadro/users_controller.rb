require_dependency 'quadro/application_controller'

module Quadro
  class UsersController < ApplicationController
    before_filter :authenticate_user!

    respond_to :js, :json, :xml

    def update
      if user.update_with_password(params[:user])
        sign_in user, bypass: true
      end
    end
  end
end
