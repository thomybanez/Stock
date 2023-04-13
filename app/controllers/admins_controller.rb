class AdminsController < ApplicationController

    def home
        @user = User.all
    end

end