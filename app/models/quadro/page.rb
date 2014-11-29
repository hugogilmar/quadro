module Quadro
  class Page < ActiveRecord::Base
    # attributes
    attr_accessible :title
    store :settings, accessors: [:description]

    # validations
    validates :title, presence: true
    validates :slug, uniqueness: true

    # associations
    has_many :widgets

    # behaviours
    has_ancestry
  end
end
