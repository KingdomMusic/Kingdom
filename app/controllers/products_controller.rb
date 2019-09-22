class ProductsController < ApplicationController
  PER = 10
  def index
    @products = Product.all.order(created_at: :desc)
    @products = Product.page(params[:page]).per(10)
  end

  def show
    
  end
end
