class UsersController < ApplicationController
    before_action :authorized, except: [:new, :create]

    def homepage
        @user = current_user
    end

    def new
      @user = User.new
    end

    def create
        @user = User.new(new_user_params)
        if @user.valid?
            @user.save
            session[:id] = @user.id
            redirect_to homepage_path
        else
            render :new
        end

    end

    def show
        @user = User.find(params[:id])
    end

    def edit
        @user = current_user
    end

    def update
        @user = current_user
        if @user.update(edit_user_params)
        redirect_to homepage_path
        else
            render :edit
        end
    end

    def destroy
      current_user.destroy
      redirect_to signup_path
    end

    def profile
    end

    def messages
        @user = current_user
    end

    def sent_messages
        @user = current_user
    end

    def new_message
        @user = current_user
        @message = Message.new
    end

    def send_message
       Message.create(message_params)
       redirect_to messages_path
    end


    private

    def user_params
        params.require(:user).permit(:name, :location, :age, :avatar, :password, :username)
    end

    def new_user_params
        params.require(:user).permit(:name, :location, :age, :avatar, :password,:password_confirmation, :username)
    end

    def edit_user_params
        params.require(:user).permit(:name, :location, :age, :avatar, :password, :password_confirmation)
    end

    def message_params
        params.require(:message).permit(:content,:sender_id,:receiver_id)
    end
end
