class WalletsController < ApplicationController

    #user balance deposit
    def add_balance
        wallet = User.find_by(id: session[:user_id]).wallet
        amount = params[:wallet][:amount].to_f
        if amount === 0
            flash[:alert] = "Please input an amount"
        else
            wallet.balance += amount
            wallet.save
            @wallet = wallet.reload
        end
      
        if wallet.persisted?
          flash[:notice] = "Amount deposited successfully!"
          redirect_to add_balance_path
        else
          flash[:alert] = "No"
        end
    end

    #user balance withdraw   
    def subtract_balance
        wallet = User.find_by(id: session[:user_id]).wallet
        amount = params[:wallet][:amount].to_f
        if wallet.balance < amount
            flash[:alert] = "Insufficient balance"
        elsif amount === 0
            flash[:alert] = "Please input an amount"
        else
            wallet.balance -= amount
            wallet.save
            @wallet = wallet.reload
        end
      
        if wallet.persisted?
          flash[:notice] = "Amount withdrawn successfully!"
          redirect_to subtract_balance_path
        else
          flash[:alert] = "No"
        end
      end

    #user balance type of transaction
    def new
        @wallet = User.find_by(id: session[:user_id]).wallet.balance
        @transaction_type = params[:transaction_type]

        
    end

    def create
        @wallet = Wallet.all
    end
    
    private

    def set_wallet
        @wallet = Wallet.find(params[:id])
    end
end