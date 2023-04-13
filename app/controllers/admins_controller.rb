class AdminsController < ApplicationController
    def home
        @user = User.all
      end  
    

    def verify
          user = User.find_by(email: user_params[:email])

        if (user.is_verified == false)
          user.update(is_verified: true)
          redirect_to admins_home_path
        else
          user.update(is_verified:false)
          redirect_to admins_home_path
        end
      end
  
    private
  
    def user_params
      params.require(:user).permit(:email)
    end
  end