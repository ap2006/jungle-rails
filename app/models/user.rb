class User < ActiveRecord::Base

  has_secure_password
  has_many :reviews

  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true
  validate :password_length
#Authenicate password informatios
  def self.authenticate_with_credentials(email, password)
    existingUser = User.find_by_email(email)
      if existingUser && existingUser.authenticate(password)
        return existingUser
      else
        return nil
      end
  end

private

  def password_length
      errors.add(:password, 'Should be equal to or longer than 8 characters') if password && password.size < 8
    end


end
