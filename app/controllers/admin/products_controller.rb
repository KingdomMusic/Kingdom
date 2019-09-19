class Admin::ProductsController < ApplicationController
  def new
  	@product = Product.new
  end

  def create
  	@product = Product.new(product_params)
  	if @product.save
  		flash[:notice] = "商品が登録されました"
  		redirect_to new_admin_product_path
  	else
  		render "new"
  	end
  end

  def index
  	@products = Product.all
  end

  def show
  	@product = Product.find(params[:id])
  end

  def edit
  	@product = Product.find(params[:id])
  end

  def update
  	@product = Product.find(params[:id])
  	if @update.update
  		flash[:notice] = "商品情報を更新しました"
  		redirect_to admin_product_path(@product)
  	else
  		render "edit"
  	end
  end

  def destroy
  	@product = Product.find(params[:id])
  	@product.destroy
  	redirect_to admin_products_path
  end

  private
  def product_params
  	params.require(:product).permit(:product_name,:cd_type, :artist_id, :jacket_image, :price, :label_id, :genre_id, :stock, :sell_status, :solo_at)
  end
end
