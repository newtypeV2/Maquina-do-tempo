class MatchmakerController < ApplicationController
    def index
        @users = current_user.available_pool
    end
end
