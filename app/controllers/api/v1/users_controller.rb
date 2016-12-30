module Api::V1
  class UsersController < ApplicationController
    before_action :set_user, only: [:show]

    # GET /users
    def index
      @users = User.all
      render json: { users: @users }, except: [:created_at, :updated_at]
    end

    # GET /users/1
    def show
      render json: @user
    end

    private
      def set_user
        @user = User.find(params[:id])
      end

      def user_params
        params.require(:user).permit(:username, :email)
      end
  end
end
