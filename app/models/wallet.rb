class Wallet < ApplicationRecord
    include ActionView::Helpers::NumberHelper


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
