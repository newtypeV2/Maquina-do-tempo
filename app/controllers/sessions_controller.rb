class SessionsController < ApplicationController
    def new
    end

    def create
        @user = User.find_by(name: params[:name])
        if @user
            session[:id] = @user.id
            redirect_to homepage_path
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
