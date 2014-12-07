module Quadro
  class User < ActiveRecord::Base
    # attributes
    attr_accessible :email, :password, :password_confirmation, :remember_me

    # behaviours
    devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable, :lockable
  end
end
