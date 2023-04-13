class SessionsController < ApplicationController

    def signin

    end

    def signin_authenticate
      @user = User.find_by(email: user_params[:email])
      if @user.authenticate(user_params[:password])
        redirect_to users_home_path(@user)
      else
        render :signin
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
end
