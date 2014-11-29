module Quadro
  class Widget < ActiveRecord::Base
    # attributes
    attr_accessible :name

    # validations
    validates :name, uniqueness: true, scope: :page_id

    # associations
    belongs_to :page
  end
end
