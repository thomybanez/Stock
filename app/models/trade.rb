class Trade < ApplicationRecord
    belongs_to :user
    after_save :transact
    def transact
        if entry_price
            self.user.wallet.balance -= entry_price * size
            self.user.wallet.save
        elsif exit_price
            self.user.wallet.balance += exit_price * size
            self.user.wallet.save
        end
    end
end
