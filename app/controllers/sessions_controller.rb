class SessionsController < ApplicationController
    before_action :authorized, except: [:login, :create]

    def login
        if logged_in?
            redirect_to homepage_path
        end
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
