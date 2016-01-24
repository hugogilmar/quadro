module Quadro
  class Widget < ActiveRecord::Base
    # attributes
    attr_accessible :name, :type

    # validations
    validates :name, uniqueness: { scope: :page_id }

    # associations
    belongs_to :page
  end
end
