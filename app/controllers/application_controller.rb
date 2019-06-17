class ApplicationController < ActionController::Base

    def current_user
        if @current_user
            return @current_user
        else
            @current_user = User.find_by(id: session[:id])
        end
    end
end
