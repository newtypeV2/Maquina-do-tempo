class ApplicationController < ActionController::Base

helper_method :current_user, :logged_in?

    def current_user
        if @current_user
            return @current_user
        else
            @current_user = User.find_by(id: session[:id])
        end
    end

    def logged_in?
        !!current_user
    end

    def authorized
        return head(:forbidden) unless logged_in?
    end
end
