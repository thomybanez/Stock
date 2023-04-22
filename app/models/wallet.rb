class Wallet < ApplicationRecord
    include ActionView::Helpers::NumberHelper
    validates :balance, numericality: { greater_than_or_equal_to: 0 }
    
    belongs_to :user
    has_many :transfers
   

    def add_balance(amount)
        self.balance += amount
        save
    end

    def subtract_balance(amount)
        self.balance -= amount
        save
    end
end
