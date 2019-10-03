class Admin::ReviewsController < ApplicationController
  def new
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

  def _index
  end
end
