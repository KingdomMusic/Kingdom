class Admin::LabelsController < ApplicationController
before_action :check_admin

  def index
  	@labels = Label.all
  end

  def new
  	@label = Label.new
  end

  def create
  	@label = Label.new(label_params)
  	if @label.save
      flash[:notice] = "レーベルが追加されました"
  	   redirect_to admin_labels_path
    else
      render "new"
    end
  end

  def edit
  	@label = Label.find(params[:id])
  end

  def update
  	@label = Label.find(params[:id])
  	if  @label.update(label_params)
        flash[:notice] = "レーベルが更新されました"
  	    redirect_to admin_labels_path
    else
        render "edit"
    end
  end

  def destroy
  	label = Label.find(params[:id])
    label.discard
  	redirect_to admin_labels_path
  end

  private
  def label_params
  	params.require(:label).permit(:name)
  end
end
