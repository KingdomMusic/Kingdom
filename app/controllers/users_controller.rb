class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def top
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  private
  def params_user
    params.require(:user).permit(:last_name_characters, :first_name_characters, :last_name_kana,
      :first_name_kana, :profile_image, :postal_code, :address, :phone_number,)
  end

end
