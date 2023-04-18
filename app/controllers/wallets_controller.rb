class WalletsController < ApplicationController

    #user balance deposit
    def add_balance
        amount = params[:amount].to_f
        @wallet.add_balance(amount)
        redirect_to home_path
    end

    #user balance withdraw
    def subtract_balance
        amount = params[:amount].to_f
        @wallet.subtract_balance(amount)
        redirect_to home_path
    end

    #user balance type of transaction
    def new
        user_id = session[:user_id]
        @user = User.find_by(id: user_id)


        @transaction_type = params[:transaction_type]
        @wallet = Wallet.new(transaction_type: @transaction_type)
    end

    def create
        @wallet = Wallet.all
    end
    
    private

    def set_wallet
        @wallet = Wallet.find(params[:id])
    end
end