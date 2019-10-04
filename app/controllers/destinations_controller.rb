class DestinationsController < ApplicationController

  def update
    destination = Destination.find_by(user_id: current_user)
    destination.update(params_destination)
    redirect_to order_items_path
  end

  private
  def params_destination
    params.require(:destination).permit(:address_name, :postal_code, :address, :phone_number)
  end
end
