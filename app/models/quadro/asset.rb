module Quadro
  class Asset < ActiveRecord::Base
    # attributes
    # attr_accessible :attachment

    delegate :url, to: :attachment

    # associations
    belongs_to :assetable, polymorphic: true
  end
end
