class ProductsController < ApplicationController
before_action :check_user

  def index
    @products = Product.all.order(created_at: :desc)
    @products = Product.page(params[:page]).per(10)
  end

  def show
    @product = Product.find(params[:id])
    @discs = Product.find(params[:id]).discs
    @stock = @product.product_stock
    @cart = Cart.find_by(product_id: @product.id, user_id: current_user.id)
    if @cart.blank?
      @cart = Cart.new
    end
    @review = @product.reviews.page(params[:page])
  end

end
