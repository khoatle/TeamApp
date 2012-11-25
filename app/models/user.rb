class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation
  validates :name, presence: true, length: { maximum: 50 }

  validates :password, presence: true, length: { minimum: 8}
  validates :password_confirmation, presence: true

  has_secure_password

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, 
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  before_save { |user| user.email = email.downcase }

#  def authenticate password
#    return nil if password == nil
#    return self if has_password?(password) and self.valid?
#  end
#
#  def has_password?(submitted_password)
#    encrypt_password == encrypt(submitted_password)
#  end
#
#  private
#    def encrypt_password
#      self.salt = make_salt if new_record?
#      self.encrypted_password = encrypt(password)
#    end
#
#    def encrypt(string)
#      secure_hash("#{salt}--#{string}")
#    end
#
#    def make_salt
#      secure_hash("#{Time.now.utc}--#{password}")
#    end
#
#    def secure_hash(string)
#      Digest::SHA2.hexdigest(string)
#    end

end
