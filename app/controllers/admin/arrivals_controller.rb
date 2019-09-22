class Admin::ArrivalsController < ApplicationController
  def new
  	@arrival = Arrival.new
  	@product = Arrival.products.find_by(params[:product_id])
  end

  def create
  	@arrival = Arrival.new(arrival_params)
  	if @arrival.save
  		flash[:notice] = "入荷情報が登録されました"
  		redirect_to admin_products_path
  	else
  		render "new"
  	end
  end

  	private
  	def arrival_params
  		params.require.(:arrival).permit(:product_id, :arraival_count, :arrival_date)
    end
end