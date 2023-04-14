class WalletsController < ApplicationController

    def add_balance
        amount = params[:amount].to_f
        @wallet.add_balance(amount)
        redirect_to home_path
    end

    def subtract_balance
        amount = params[:amount].to_f
        @wallet.subtract_balance(amount)
        redirect_to home_path
    end

    def balance_form
    end
    
    private

    def set_wallet
        @wallet = Wallet.find(params[:id])
    end
end