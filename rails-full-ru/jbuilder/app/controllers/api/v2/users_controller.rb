# frozen_string_literal: true

module Api
  module V2
    class UsersController < Api::ApplicationController # rubocop:disable Style/Documentation
      # BEGIN
      def index
        @users = User.includes(:posts).all
        render json: @users, each_serializer: UserSerializer
      end

      def show
        @user = User.includes(:posts).find(params[:id])
        render json: @user, serializer: UserSerializer
      end
      # END
    end
  end
end
