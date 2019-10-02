class OrdersController < ApplicationController
  def index
  end

  def done
  end

  private
  def order_params
  	params.require(:order).permit(:user_id,:destination_id,:total_count,:total_price,:delivary_status,:option)
  end
end
