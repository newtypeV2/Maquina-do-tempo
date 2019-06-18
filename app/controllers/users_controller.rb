class UsersController < ApplicationController

    def homepage
        @user = current_user
    end

    def new
      @user = User.new
    end

    def create
      byebug
    end

    def show
        @user = User.find(params[:id])
    end

    def edit
        @user = current_user
    end

    def update
        current_user.update(edit_user_params)
        redirect_to homepage_path
    end

    private

    def user_params
        params.require(:user).permit(:name, :location, :age, :avatar, :password, :username)
    end

    def edit_user_params
        params.require(:user).permit(:name, :location, :age, :avatar, :password)
    end
end
