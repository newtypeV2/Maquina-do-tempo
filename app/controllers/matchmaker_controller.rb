class MatchmakerController < ApplicationController
    def index
        @users = current_user.available_pool
    end

    def clicked_yes
        Match.create(swiper_id: current_user.id, swiped_id: params[:id], gave_chance: true)
        redirect_to matchmaker_index_path
    end

    def clicked_no
        Match.create(swiper_id: current_user.id, swiped_id: params[:id], gave_chance: false)
        redirect_to matchmaker_index_path
    end
end
