class OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    # @orders = @user.orders.select { |order| order.is_confirmed == false }
  end
  
  def payment_method
    @order = Order.find(params[:id])
  end
  
  def payment_confirmation
    @order = Order.find(params[:id])
  end
  
  def thanks_message
    @order = Order.find(params[:id])
  end
  
  def account
    # @order = Order.find(params[:id])
    # @orders = current_user.orders
  end

  def my_orders
    @user = current_user.id
  end
  
  
  def profile
    @order = Order.find(params[:id])
  end
end
