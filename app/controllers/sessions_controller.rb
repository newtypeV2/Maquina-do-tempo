class SessionsController < ApplicationController
    def new
    end

    def create
        @user = User.find_by(name: params[:name])
        if @user
            session[:id] = @user.id
            redirect_to user_path(@user)
        else
            flash.notice = "USER NOT FOUND"
            render :new
        end
    end

    def destroy
        session.clear
        redirect_to login_path
    end
end
