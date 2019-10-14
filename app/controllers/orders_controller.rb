class OrdersController < ApplicationController
before_action :check_user

  def create
    order = current_user.orders.new(order_params)
    order.total_count = params[:total_count]
    order.total_price = params[:total_price]
    order.address_name = params[:destination_address_name]
    order.postal_code = params[:destination_postal_code]
    order.address = params[:destination_postal_code]
    order.phone_number = params[:destination_phone_number]
    order.delivery_status = 0
    order.save
    carts = current_user.carts
    carts.each do |cart|
      order_item = OrderItem.find_by(product_id: cart.product_id, order_id: 0)
      order_item.order_id = order.id
      order_item.save
      cart.destroy
    end
    redirect_to order_done_path
  end

  def show
      @order = Order.find(params[:id])
  end

  def done
  end

  def index
    @orders = current_user.orders
  end

  private
  def order_params
    params.require(:order).permit(:option)
  end

end

