require 'rails_helper'

RSpec.describe "Trades", type: :request do
  user = User.create(email: "carll@yahoo.com")
  user_id = user.id
  describe 'trade' do
    context "when a user is authenticated" do
      it "redirects to trade page" do
        get '/trade'
        expect(response).to redirect_to(trade_path)
      end
    end

    context "when a user is not authenticated" do
      before do
        get '/trade'
      end
      it "redirects to the sign-in page" do
        expect(response).to redirect_to(sessions_signin_path)
      end
    end

    context "when a user buys a coin" do
      trade = Trade.new(coin_id: "bitcoin", entry_price: 28000, size: 1.0, position_id: 2, user_id: 10)
      @position = Position.new()
      it "trades successfully" do
        post '/buy_coin'
        expect(response).to redirect_to trade_path(coin_id: trade.coin_id, entry_price: trade.entry_price, transaction_type: 'buy')
      end
      it "trades successfully and adds a new position" do
        post '/buy_coin'
        expect(response).to redirect_to trade_path(coin_id: trade.coin_id, entry_price: trade.entry_price, transaction_type: 'buy')
      end
    end
    it 'renders market' do
      get '/market'
      expect(response).to redirect_to market_path
    end
  end
end
