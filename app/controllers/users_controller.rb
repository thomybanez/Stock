class UsersController < ApplicationController

    def home
        if !@user
            redirect_to sessions_signin_path
        end        
    end
end
