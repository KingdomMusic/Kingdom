class ProductsController < ApplicationController
before_action :check_user

  def index
    @products = Product.all.order(created_at: :desc)
    @products = Product.page(params[:page]).per(10)
  end

  def show
    @product = Product.find(params[:id])
    @discs = Product.find(params[:id]).discs
    @stock = @product.stock
    @cart = Cart.find_by(product_id: @product.id, user_id: current_user.id)
    if @cart.blank?
      @cart = Cart.new
    end
    @review = @product.reviews.page(params[:page])
  end

  def search
    if params[:search].empty?
      @products = Product.all.order(created_at: :desc)
      @products = Product.page(params[:page]).per(10)
      render :index, locals: { products: @products}
    else
      @products = Product.order("created_at DESC").page(params[:page]).per(10).search(params[:search])
      render :index, locals: { products: @products}
    # elsif params[:search_products] == "1"
    #   @products = Product.with_artists.page(params[:page]).per(10)
    #   render :index, locals: { products: @products}
    # elsif params[:search_products] == "2"
    #   @products = Product.includes(descs: :songs).where('name LIKE(?)', "%#{params[:ward]}%").references(descs: :songs).page(params[:page]).per(10)
    #   render :index, locals: { products: @products}
    # elsif params[:search_products] == "3"
    #   @products = Product.includes(:genres).where('name LIKE(?)', "%#{params[:ward]}%").references(:genres).page(params[:page]).per(10)
    #   render :index, locals: { products: @products}
    # elsif params[:search_products] == "4"
    #   @products = Product.includes(:labels).where('name LIKE(?)', "%#{params[:ward]}%").references(:labels).page(params[:page]).per(10)
    #   render :index, locals: { products: @products}
    end
  end

end
