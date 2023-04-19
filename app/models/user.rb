
class User < ApplicationRecord
    has_secure_password    
    validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    #validates :password,  presence: true, length: {minimum: 3}

    has_many :trades
    has_one :wallet
    after_create :create_user_wallet

    private

    def create_user_wallet
        self.create_wallet
    end
end
