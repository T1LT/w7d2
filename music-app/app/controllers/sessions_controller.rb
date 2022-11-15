class SessionsController < ApplicationController
    def create
        @user = User.find_by_credentials(email, password)
        if @user
            login!(@user)
            redirect_to user_url(@user)
        else
            flash[:messages] = @user.errors.full_messages
        end
    end

    def new
        render :new
    end

    def destroy
        logout
        redirect_to users_url
    end
end