require 'digest/md5'

class User < ActiveRecord::Base
  has_many :ribbits
  before_validation :prep_email
  before_save :create_avatar_hash

  attr_accessible :email, :name, :password, :password_confirmation, :username, :avatar_hash

  has_secure_password

  validates :email, uniqueness: true, presence: true, format: { with: /^[\w\.+-]+@([\w]+\.)+\w+$/ }
  validates :username, uniqueness: true, presence: true
  validates :name, presence: true

  private

  def prep_email
    self.email = self.email.strip.downcase if self.email
  end

  def create_avatar_hash
    self.avatar_hash = "http://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(self.email)}?s=50"
  end
end
