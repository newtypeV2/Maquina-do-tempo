class SessionsController < ApplicationController
    def login
    end

    def create
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            session[:id] = @user.id
            redirect_to homepage_path
        else
            flash.notice = "No username/password combination found."
            render :login
        end
    end

    def destroy
        session.clear
        redirect_to login_path
    end
end
