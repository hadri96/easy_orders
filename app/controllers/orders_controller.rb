class OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    # @orders = @user.orders.select { |order| order.is_confirmed == false }
  end
  
  def payment_method
    @order = Order.find(params[:id])
  end
  
  def payment_confirmation
    
  end
  
  def thanks_message
    @order = Order.find(params[:id])
  end
  
  def my_orders
    @order = Order.find(params[:id])
  end
  
  def profile
    @order = Order.find(params[:id])
  end
end
