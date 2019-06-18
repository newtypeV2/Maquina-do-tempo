class UsersController < ApplicationController
    
    def homepage
        @user = current_user
    end

    def show
        @user = User.find(params[:id])
    end

    def edit
        @user = current_user
    end

    def update
        current_user.update(user_params)
        redirect_to homepage_path
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
       redirect_to sent_messages_path
    end


    private

    def user_params
        params.require(:user).permit(:name, :location, :age, :avatar)
    end

    def message_params
        params.require(:message).permit(:content,:sender_id,:receiver_id)
    end
end
