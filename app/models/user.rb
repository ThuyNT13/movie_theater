class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[a-z\d]{1}+[\w.+%-]+@[a-z\d]{1}+(?:[a-z\d\-]+\.)+[a-z]{2,}\z/i

  has_secure_password

  before_save { self.username = username.downcase }
  before_save { self.email = email.downcase }


  validates :username, :email, :password,
    presence: true

  validates :username, :password,
    length: { minimum: 6 }

  validates :username, :email,
    uniqueness: { case_sensitive: false }

  validates :email,
    format: { with: VALID_EMAIL_REGEX }

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ?
      BCrypt::Engine::MIN_COST : BCrypt::Engine.cost

    BCrypt::Password.create(string, cost: cost)
  end

end
