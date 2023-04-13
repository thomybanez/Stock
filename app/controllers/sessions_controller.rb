class SessionsController < ApplicationController

    def signin
    end

    def signin_authenticate
      if params[:signin].present? && params[:signin][:email].present? && params[:signin][:password_digest].present?
        user = User.authenticate(params[:signin][:email], params[:signin][:password_digest])
        if user
          session[:user_id] = user.id
          redirect_to users_home_path, notice: 'Successfully logged in!'
          @message = "Successfully logged in as #{user.email}"
        else
          flash.now[:alert] = 'Invalid username or password'
          @message = 'Invalid username or password'
        end
      else
        @message = 'Please enter your username and password'
      end
    end
    
    def signup
      @user = User.new
    end

    def signup_submit
        @user = User.new(user_params)
      
        if @user.save
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
