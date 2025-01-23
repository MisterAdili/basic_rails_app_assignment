class UsersController < ApplicationController
    skip_before_action :verify_authenticity_token

    def create
        @new_user = User.create(username: params[:username], email: params[:email], first_name: params[:first_name], last_name: params[:last_name])

        render json: { user: @new_user }
    end

    def list
        @users = User.all

        render json: @users

    end


end
