class AdminsController < ApplicationController

  #4: As an Admin, I want to see all the users that registered in the app so I can track all the users.
    def admin
      @user = User.all.order(created_at: :desc)
    end

  #1: As an Admin, I want to create a new user to manually add them to the app.
    def user_add
      @user = User.new
    end

    def user_add_submit
      @user = User.new(admin_added_user_params)

      if @user.save
        flash[:notice] = "User successfully added"
        redirect_to admins_admin_path
      else        
        render "user_add", status: :unprocessable_entity
      end
    end

  #2: As an Admin, I want to edit a specific user to update his/her details.
    def user_edit
      @user = User.find_by(id: params[:id])
    end

    def user_update
      @user = User.find_by(id: params[:id])
        if @user.update(user_update_params)
        redirect_to admins_user_view_path
      else
        flash[:alert] = "Invalid email format"
        redirect_to admins_user_edit_path
      end
    end

  #3: As an Admin, I want to view a specific user to show his/her details.
    def user_view
      @user = User.find_by(id: params[:id])
    end

  #5: As an Admin, I want to approve a trader sign up so that he/she can start adding stocks.
    def user_verify
      @user = User.find(params[:id])
      @user.update(is_verified: !@user.is_verified)

        if @user.is_verified == true
          flash[:notice] = "User verified"
          @user.update(is_verified: true)
        else
          flash[:alert] = "User unverified"
          @user.update(is_verified: false)
        end
      redirect_to admins_user_view_path
    end

  #6: As an Admin, I want to have a page for pending trader sign ups to easily check if there's a new trader sign up.
    def user_sort
      @user = User.all.order(created_at: :desc)
        if params[:status] == "pending"          
            @user = User.where(is_verified: false).order(created_at: :desc)
            render "user_sort"                          
        elsif params[:status] == "verified"            
            @user = User.where(is_verified: true).order(created_at: :desc)
            render "user_sort"
        end                
    end

  #7: As an Admin, I want to see all the transactions so that I can monitor the transaction flow of the application.
    def user_transactions
    end


    private
    def user_update_params
      params.require(:user).permit(:email)
    end

    def admin_added_user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
end