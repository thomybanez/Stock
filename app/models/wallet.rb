class Wallet < ApplicationRecord
    include ActionView::Helpers::NumberHelper
    validates :amount, numericality: { greater_than_or_equal_to: 0 }

    has_many :transfer
    belongs_to :user

    def add_balance(amount)
        self.balance += amount
        save
    end

    def subtract_balance(amount)
        self.balance -= amount
        save
    end
end
