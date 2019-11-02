class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
    @products = Product.page(params[:page]).per(10)
    @products.each do |product|
      if product.stock == 0
        product.sell_status = "在庫なし"
        product.save
      end
    end
  end

  def show
    @product = Product.find(params[:id])
    @discs = Product.find(params[:id]).discs
    @stock = @product.stock
    @review = @product.reviews.page(params[:page])
    if user_signed_in?
      @cart = Cart.find_by(product_id: @product.id, user_id: current_user.id)
      if @cart.blank?
        @cart = Cart.new
      end
    end
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
