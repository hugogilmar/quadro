module Quadro
  class Interaction < ActiveRecord::Base
    # attributes
    attr_accessible :content, :ip_address, :user_agent
    serialize :content, Hash

    # associations
    belongs_to :interactable, polymorphic: true

    # scopes
    default_scope order('quadro_interactions.created_at DESC')
  end
end
