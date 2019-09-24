class CartsController < ApplicationController
  def index
    @carts = current_user.carts
  end

  def create
    cart = Cart.new
    cart.user_id = current_user.id
    cart.product_id = params[:product_id]
    cart.save
    redirect_to carts_path
  end

  def destroy
    cart = Cart.find(params[:id])
    cart.destroy
    redirect_to carts_path
  end

end
