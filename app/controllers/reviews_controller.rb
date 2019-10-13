class ReviewsController < ApplicationController
before_action :check_user

  def new
  	@review = Review.new
  	@product = Product.find_by(params[:product_id])
  end

  def create
  	product = Product.find_by(params[:product_id])
  	review = Review.new(review_params)
  	review = current_user.review.new(review_params)
  	review.product_id = product.id
  	review.save
  	redirect_to product_path(product)
  end

  def edit
  	@review = Review.find(params[:id])
  end

  def update
  	@review = Review.find(params[:id])
  	@review.update(review_params)
  	redirect_to product_path(@review.product)
  end

  def destroy
  	@review = Review.find(params[:id])
  	@review.destroy
  	redirect_to product_path(@review.product)
  end

  private
  def review_params
  	params.require(:review).permit(:review, :user_id, :product_id)
  end
end
