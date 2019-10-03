class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @order_item = Order.find(params[:id]).order_items
  end

  private
  def order_params
  	params.require(:order).permit(:user_id,:destination_id,:total_count,:total_price,:delivary_status,:option)
  end
end
