class User < ActiveRecord::Base
  attr_accessible :group_id, :name, :email,
    :password, :password_confirmation, :remember_me

  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  belongs_to :group
end
