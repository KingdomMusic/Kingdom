class CartsController < ApplicationController
  def index
    @carts = current_user.carts
  end

  def create
    product = Product.find(params[:product_id])
    cart = current_user.carts.new(cart_params)
    cart.product_id = product.id
    cart.save
    redirect_to carts_path
   end

  def update
    cart = Cart.find(params[:id])
    cart.update
    redirect_to carts_path
  end

  def destroy
    cart = Cart.find(params[:id])
    cart.destroy
    redirect_to carts_path
  end

private
  def cart_params
    params.require(:cart).permit(:count)
  end

end
