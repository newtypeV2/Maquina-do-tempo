class MatchmakerController < ApplicationController
    before_action :authorized

    def index
        # if params[:filter]
        #     if params[:filter].downcase=="male" || params[:filter].downcase=="female" || params[:filter].downcase=="other"
        #     @users = current_user.filter_available_pool_by_gender(params[:filter].downcase)
        #     else
        #         redirect_to matchmaker_index_path
        #     end
        # else
        #     @users = current_user.available_pool
        # end
        @user = @current_user.available_pool.sample
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
