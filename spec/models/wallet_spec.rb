require 'rails_helper'

RSpec.describe Wallet, type: :model do

  context "when creating a new wallet" do
    let(:user) { User.create(email: "john@yahoo.com") }
    let(:wallet) { Wallet.new(user: user, balance: -100) }
  
    it "requires balance to be greater than or equal to 0" do
      expect(wallet).not_to be_valid
      expect(wallet.errors[:balance]).to include("must be greater than or equal to 0")
    end     
  end

  describe "#add_balance" do
    let(:user) { User.create(email: "john@yahoo.com") }
    let(:wallet) { Wallet.create(user: user, balance: 100) }

    it "increments the balance by the deposit amount" do
        wallet = FactoryBot.create(:wallet, balance: 100)
        expect{ wallet.add_balance(50) }.to change{ wallet.reload.balance }.from(100).to(150)
      end

    it "decrements the balance by the withdraw amount" do
        wallet = FactoryBot.create(:wallet, balance: 100)
        expect{ wallet.subtract_balance(50) }.to change{ wallet.reload.balance }.from(100).to(50)
    end
  end

  describe "User-Wallet association" do
    it "associates a wallet with a user" do
      user = User.create(email: "test@example.com", password: "password")
      wallet = Wallet.create(user_id: user.id)
  
      expect(wallet.user_id).to eq(user.id)      
    end
  end  

end
