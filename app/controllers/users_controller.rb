class UsersController < ApplicationController
    before_action :set_user, only: %i[show edit update destroy]

    def home
        @users = User.all
    end 

    def signup
        @users = User.new       
    end

    def create
        @user = User.new(user_params)
        @user.save
 
    end

    private
    def set_user
    end

    def user_params        
        params.permit(:username, :email, :password)
    end

end
