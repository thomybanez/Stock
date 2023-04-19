class Trade < ApplicationRecord
    def self.total_price(entry_price, size)
        entry_price.to_f * size.to_f
    end
end
