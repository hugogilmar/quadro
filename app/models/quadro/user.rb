module Quadro
  class User < ActiveRecord::Base
    # attributes
    # attr_accessible :email, :password, :password_confirmation, :remember_me, :name

    # behaviours
    devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable, :lockable
    acts_as_url :name, url_attribute: :slug, sync_url: true

    # validations
    validates :name, presence: true, length: { maximum: 60 }

    # associations
    has_many :pages, dependent: :destroy

    # scopes
    scope :ordered, -> { order('quadro_users.name ASC') }
  end
end
