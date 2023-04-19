class SessionsController < ApplicationController

    def signin   
    end

    def signin_authenticate 
      @user = User.new(email: login_params[:email], password: login_params[:password])
      if @user.email.empty? 
        flash[:alert] = "Email can't be blank"        
        redirect_to sessions_signin_authenticate_path

      elsif @user.password.blank?
        flash[:alert] = "Password can't be blank"        
        redirect_to sessions_signin_authenticate_path

      else        
        @user = User.find_by(email: login_params[:email])
        if @user && @user.authenticate(login_params[:password])
          session[:user_id] = @user.id
          flash[:notice] = "Login Successful"
          redirect_to users_home_path
        else 
          flash[:alert] = "Password is invalid"
          redirect_to sessions_signin_authenticate_path
        end
      end
    end


    def signup
        @user = User.new
    end

    def signup_submit
        @user = User.new(user_params)
      
        if @user.save
          flash[:notice] = "Signed up successfully!"
          redirect_to users_home_path
        else
          render :signup, status: :unprocessable_entity
        end
    end

    private

    def user_params        
        params.require(:user).permit(:email, :password, :password_confirmation)
    end

    def login_params
        params.require(:login).permit(:email, :password)
    end
end
