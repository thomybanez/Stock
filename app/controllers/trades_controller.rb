class TradesController < ApplicationController
    before_action :set_user
    before_action :set_position, only: [:trade, :buy_coin]
    
    def market        
            @api = CoinGecko::Client.retrieve_coin[:data]     
    end

    def trade
        @api = CoinGecko::Client.retrieve_coin[:data]  
        @coin_id = params[:coin_id]
        @entry_price = params[:entry_price]
        @exit_price = params[:exit_price]
        @size = params[:size]
        @transaction_type = params[:transaction_type]
        @trade = Trade.new
    end

    def buy_coin
        @trade = Trade.new(buy_params)
        @trade.user_id = session[:user_id]
        @position = Position.find_by(coin_id: @trade.coin_id, user_id: session[:user_id])

        puts @position
        if @position && @position.quantity > 0
            puts "spa"
            @trade.position_id = @position.id
            @position.quantity += @trade.size
            @position.average_entry = ((@position.average_entry*(@position.quantity - @trade.size)+(@trade.entry_price*@trade.size))/@position.quantity)
            @position.save
            @position.reload
            flash[:notice] = "Trade successful!"
            if @trade.save
                redirect_to trade_path(coin_id: @trade.coin_id, entry_price: @trade.entry_price, transaction_type: 'buy')
            end
        else
            puts "spa2"
            flash[:notice] = "Trade successful! Added new position."
            new_position = Position.create(quantity: @trade.size, coin_id: @trade.coin_id, average_entry: @trade.entry_price, user_id: session[:user_id])
            @trade.position_id = new_position.id
            if @trade.save
                redirect_to trade_path(coin_id: @trade.coin_id, entry_price: @trade.entry_price, transaction_type: 'buy')
            end
        end
    end
    def sell_coin
        @trade = Trade.new(sell_params)
        @trade.user_id = session[:user_id]
        @position = Position.find_by(coin_id: @trade.coin_id, user_id: session[:user_id])

        if @position.quantity >= @trade.size
            @trade.position_id = @position.id
            @trade.pnl = (@trade.exit_price - @position.average_entry) * @trade.size
            @position.quantity -= @trade.size
            @position.save
            @position.reload
            flash[:notice] = "Trade successful!"
            if @trade.save
                redirect_to trade_path(coin_id: @trade.coin_id, exit_price: @trade.exit_price, transaction_type: 'sell')
            end
        else
            flash[:alert] = "Insufficient quantity."
            redirect_to trade_path(coin_id: @trade.coin_id, exit_price: @trade.exit_price, transaction_type: 'sell')
        end
    end

    def transactions
        @trade = Trade.where(user_id: session[:user_id])
    end

    private
    def set_position
        @position = Position.where(user_id: session[:user_id])
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
    def buy_params
        params.require(:trade).permit(:entry_price, :coin_id, :size)
    end

    def sell_params
        params.require(:trade).permit(:exit_price, :coin_id, :size)
    end
end