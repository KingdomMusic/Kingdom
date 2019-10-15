class UsersController < ApplicationController
before_action :check_user, only:[:show, :edit, :update, :destroy]

  def top
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(params_user)
       flash[:notice] = "ユーザー情報が更新されました"
       redirect_to user_path(@user)
    else
      render "edit"
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to root_path
  end

  private
  def params_user
    params.require(:user).permit(:last_name_characters, :first_name_characters, :last_name_kana,
      :first_name_kana, :profile_image, :postal_code, :address, :phone_number,)
  end

end
