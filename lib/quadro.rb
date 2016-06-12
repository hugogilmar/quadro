require "quadro/engine"
require "quadro/loader"
require "quadro/version"
require "quadro/signature"

module Quadro
  mattr_accessor :available_widgets
  mattr_accessor :available_assets
  mattr_accessor :config

  Quadro.config = Configatron::RootStore.new

  def self.setup(&block)
    yield self.config
   end
end
