require 'rails_helper'

RSpec.describe Trade, type: :model do
   
   describe "User-Trade association" do
    it "associates a trade with a user" do
      user = User.create(email: "john@yahoo.com") # build a new user record
      trade = Trade.create(entry_price: 1, coin_id: 1, size: 1.1, user_id: user.id)

      expect(trade.user_id).to eq(user.id)
    end
  end
end