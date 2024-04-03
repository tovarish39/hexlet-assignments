# frozen_string_literal: true

module Api
  module V1
    class UsersController < Api::ApplicationController # rubocop:disable Style/Documentation
      # BEGIN
      def index
        @users = User.includes(:posts).all
        respond_to do |format|
          format.json { render :index }
        end
      end

      def show
        @user = User.includes(:posts).find(params[:id])
        respond_to do |format|
          format.json { render :show }
        end
      end
      # END
    end
  end
end
