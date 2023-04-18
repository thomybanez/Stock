class UsersController < ApplicationController
    def home
        user_id = session[:user_id]
        if user_id
            @user = User.find(user_id)
        end
    end
end
