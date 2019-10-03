class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
    @products = Product.page(params[:page]).per(10)
  end

  def show
    @product = Product.find(params[:id])
    @review = @product.review
    @discs = Product.find(params[:id]).discs
    @cart = Cart.find_by(product_id: @product.id, user_id: current_user.id)
    if @cart.blank?
      @cart = Cart.new
    end
  end

end
