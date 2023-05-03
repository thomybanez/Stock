class ApplicationController < ActionController::Base
    before_action :set_user
    before_action :set_mailer_host

private

  def set_mailer_host
    ActionMailer::Base.default_url_options[:host] = request.host_with_port
  end
      
  def set_user
    @user = User.find_by(id: session[:user_id])      
    wallet = Wallet.find_by(user_id: session[:user_id])
    @transfer = wallet.transfers.order(created_at: :desc) if wallet
    @is_admin = @user&.is_admin
    
  end
  
end