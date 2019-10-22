class Admin::UsersController < ApplicationController
before_action :check_admin

    def index
        @users = User.with_discarded
    end

    def show
        @user = User.with_discarded.find_by(id: params[:id])
    end

    def edit
        @user = User.with_discarded.find_by(id: params[:id])
    end

    def destroy
      user = User.find(params[:id])
      user.destroy
      redirect_to admin_users_path
    end
end
