class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation
  validates :name, presence: true, length: { maximum: 50 }
  validates :password, presence: true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }

  before_save { |user| user.email = email.downcase }
end
