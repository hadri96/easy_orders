class OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    # @orders = @user.orders.select { |order| order.is_confirmed == false }
  end

  def payment_method
    @order = Order.find(params[:id])
    @order.is_confirmed = true
    @order.save!
  end

  def payment_confirmation
    @order = Order.find(params[:id])

  end

  def thanks_message
    @order = Order.find(params[:id])
    # @order.is_paid = true
    # @order.save!
  end

  def account
    # @order = Order.find(params[:id])
    # @orders = current_user.orders
  end

  def my_orders_notification
    # @user = current_user.id
    @order = Order.find(params[:id])
  end

  def my_orders
    @orders = Order.all
  end
  
  def my_archives
    @orders = Order.all
  end


  def profile
    @order = Order.find(params[:id])
  end
end
