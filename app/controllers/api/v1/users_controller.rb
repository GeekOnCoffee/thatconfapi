module Api
  module V1
    class UsersController < BaseApiController
      skip_before_action :authenticate_user!

      def index
        jsonapi_render json: User.accessible_by(Ability.new(current_user))
      end

      def show
        authorize! :show, @user
        jsonapi_render json: @user
      end
    end
  end
end
