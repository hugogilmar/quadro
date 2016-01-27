require "quadro/engine"
require "quadro/loader"

module Quadro
  mattr_accessor :available_widgets
  mattr_accessor :available_assets

  self.available_widgets = []
  self.available_assets = []
end
