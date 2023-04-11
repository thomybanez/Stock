class UsersController < ApplicationController
    before_action :set_user, only: %i[show edit update destroy]

    def home
        @users = User.all
    end 

    def signup     
    end

    def create
        @users = User.create(user_params)
    end

    private
    def set_user
    end

    def user_params        
        params.require(:user).permit(:username, :email, :password)
    end

end
