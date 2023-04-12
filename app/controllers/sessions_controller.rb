class SessionsController < ApplicationController

    def signin
    end

    def signin_authenticate
    end
    
    def signup
    end

    def signup_submit
        @users = User.create(user_params)
    end

    private

    def user_params        
        params.require(:user).permit(:username, :email, :password)
    end
end
