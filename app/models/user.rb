class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation, :username

  has_secure_password

  validates :email, uniqueness: true, presence: true, format: { with: /[\w\.+-]+@([\w]+\.)+\w+/ }
  validates :username, uniqueness: true, presence: true
  validates :name, presence: true
end
