class Wallet < ApplicationRecord
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
