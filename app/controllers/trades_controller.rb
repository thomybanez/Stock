class TradesController < ApplicationController
    before_action :set_user
    
    def market
        @api = CoinGecko::Client.retrieve_coin[:data]     
    end

    def trade
        @coin_id = params[:coin_id]
        @entry_price = params[:coin_price]
        @trade = Trade.new
        @size = params[:size]
    end

    def execute
        @trade = Trade.new(trade_params)
        @trade.save
    end

    private
    def set_user
        user_id = session[:user_id]
        if user_id
            @user = User.find(user_id)
        end
        wallet = User.find_by(id: session[:user_id]).wallet
    end
    def trade_params
        params.require(:trade).permit(:entry_price, :coin_id, :size)
    end
end