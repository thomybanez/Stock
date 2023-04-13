
class User < ApplicationRecord
    has_secure_password
    validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }


    def self.authenticate(email, password)
        user = find_by(email: email)
        if user && BCrypt::Password.new(user.password_digest) == password
          user
        else
          nil
        end
      end  
end
