require 'rails_helper'

RSpec.describe Trade, type: :model do
    user = User.create(email: "carll@yahoo.com")
    wallet = Wallet.new(balance: 100, user: user)
    describe "#transact" do
        context "when entry_price is present" do
          it "decreases the user's wallet balance" do
          trade = Trade.new(entry_price: 10.0, size: 2, user: user)
  
          expect(user.wallet).to receive(:balance=).with(80.0)
          expect(user.wallet).to receive(:save)
  
          trade.transact
          end
        end
  
      context "when exit_price is present" do
        it "increases the user's wallet balance" do
          trade = Trade.new(exit_price: 12.0, size: 2, user: user)

          expect(user.wallet).to receive(:balance=).with(124.0)
          expect(user.wallet).to receive(:save)

          trade.transact
        end
    end
  end
end