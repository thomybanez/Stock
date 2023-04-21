class ApplicationController < ActionController::Base
    before_action :set_user
  
    def set_user
      @user = User.find_by(id: session[:user_id])
      @transfer = Wallet.find_by(user_id: session[:user_id]).transfers.order(created_at: :desc)
      @is_admin = @user&.is_admin
    end
  end