class Trade < ApplicationRecord
    belongs_to :user
    after_save :buy
    def buy
        self.user.wallet.balance -= entry_price * size
        self.user.wallet.save
    end
end
