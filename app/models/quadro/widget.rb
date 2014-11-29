module Quadro
  class Widget < ActiveRecord::Base
    # attributes
    attr_accessible :name

    # validations
    validates :name, uniqueness: true

    # associations
    belongs_to :widgetable, polymorphic: true
    belongs_to :page
  end
end
