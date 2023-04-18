class Wallet < ApplicationRecord

    def add_balance(amount)
        self.balance += amount
        save
    end

    def subtract_balance(amount)
        self.balance -= amount
        save
    end
end
