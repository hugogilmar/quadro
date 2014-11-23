module Quadro
  class ApplicationController < ActionController::Base
    helper_method :widgets, :widget

    private

    def widgets
      @widgets ||= Quadro::Widget.all
    end
    helper_method :widgets, :widget

    def widget
      @widget ||=
        case
        when ["create"].include?(action_name)
          Quadro::Widget.new(params[:widget])
        else
          Quadro::Widget.find(params[:id]) rescue nil
        end
    end
  end
end
