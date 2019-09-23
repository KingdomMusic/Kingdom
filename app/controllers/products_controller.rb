class ProductsController < ApplicationController
  PER = 10
  def index
    @products = Product.all.order(created_at: :desc)
    @products = Product.page(params[:page]).per(10)
  end

  def show
    @product = Product.find(params[:id])
    @discs = Product.find(params[:id]).discs
  end
end
