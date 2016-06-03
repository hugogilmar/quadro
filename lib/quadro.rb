require "quadro/engine"
require "quadro/loader"

module Quadro
  mattr_accessor :available_widgets
  mattr_accessor :available_assets
  mattr_accessor :vars

  self.available_widgets = []
  self.available_assets = []
  self.vars = {}
end
