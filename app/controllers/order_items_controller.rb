class OrderItemsController < ApplicationController
  def index
  end

  def create
    carts = current_user.carts
    carts.each do |cart|
      order_item = OrderItem.find_by(product_id: cart.product_id)
      if order_item.blank?
        order_item = OrderItem.new
        order_item.product_id = cart.product_id
        order_item.count = cart.count
        order_item.price = cart.product.price
        order_item.save
      else
        order_item.count = cart.count
        order_item.price = cart.product.price
        order_item.save
      end
    end
    redirect_to order_items_path
  end

  def destroy

  end


end
