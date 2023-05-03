class User < ApplicationRecord
  before_create :generate_verification_token
  after_create :create_user_wallet

  has_secure_password
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  # validates :password, presence: true, length: {minimum: 3}

  has_many :trades
  has_one :wallet, class_name: 'Wallet'

  

  def verify_email(verification_token)
    if self.verification_token == verification_token
      self.is_verified = true
      self.save
    else
      false
    end
  end

  private

  def create_user_wallet
    self.create_wallet
  end

  def generate_verification_token
    self.verification_token = SecureRandom.urlsafe_base64
  end


end