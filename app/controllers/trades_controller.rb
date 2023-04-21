class TradesController < ApplicationController
    before_action :set_user
    before_action :set_position, only: [:trade, :execute]
    
    def market        
            @api = CoinGecko::Client.retrieve_coin[:data]     
    end

    def trade
        @api = CoinGecko::Client.retrieve_coin[:data]  
        @coin_id = params[:coin_id]
        @entry_price = params[:entry_price]
        @size = params[:size]
        @trade = Trade.new
    end

    def execute
        @trade = Trade.new(trade_params)
        @trade.user_id = session[:user_id]

        @position = Position.find_by(coin_id: @trade.coin_id)
        puts @position
        if @position && @position.quantity > 0
            puts "spa"
            @trade.position_id = @position.id
            @position.quantity += @trade.size
            @position.average_entry = ((@position.average_entry*(@position.quantity - @trade.size)+(@trade.entry_price*@trade.size))/@position.quantity)
            @position.save
            @position.reload
        else
            puts "spa2"
            new_position = Position.create(quantity: @trade.size, coin_id: @trade.coin_id, average_entry: @trade.entry_price, user_id: session[:user_id])
            @trade.position_id = new_position.id
        end

        if @trade.save
            redirect_to trade_path(coin_id: @trade.coin_id, entry_price: @trade.entry_price)
        else
            redirect_to trade_path(coin_id: @trade.coin_id, entry_price: @trade.entry_price)
        end
    end

    private
    def set_position
        @position = Position.all
    end

    def set_user
        user_id = session[:user_id]
        if user_id
          @user = User.find(user_id)
          @wallet = @user.wallet
        else
          redirect_to sessions_signin_path
        end
    end


    def trade_params
        params.require(:trade).permit(:entry_price, :coin_id, :size)
    end
end