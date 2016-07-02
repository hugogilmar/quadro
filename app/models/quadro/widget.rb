module Quadro
  class Widget < ActiveRecord::Base
    # validations
    validates :name, uniqueness: { scope: :page_id }

    # associations
    belongs_to :page
    has_many :assets, as: :assetable, dependent: :destroy
    has_many :interactions, as: :interactable, dependent: :destroy

    # methods
    def find_asset(asset_id)
      new_asset = assets.find(asset_id) rescue nil
      new_asset.becomes(new_asset.type.constantize) unless new_asset.nil?
      new_asset
    end
  end
end
