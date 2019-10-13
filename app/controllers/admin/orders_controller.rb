class Admin::OrdersController < ApplicationController
before_action :check_admin

    def index
        @user = User.find(params[:id])
        @orders = @user.orders
    end

    def show
        @order = Order.find(params[:id])
    end

    def update
      order = Order.find(params[:id])
      order.delivery_status = params[:delivery_status]
      order.save
      if order.delivery_status == 0 || order.delivery_status == 1
        redirect_to admin_orders_receive_path
      elsif order.delivery_status == 2
        redirect_to admin_orders_done_path
      end

    end

    def receive
      @orders = Order.where(delivery_status: 0).or(Order.where(delivery_status: 1))
    end

    def done
      @orders = Order.where(delivery_status: 2)
    end
end
