class OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    # @orders = @user.orders.select { |order| order.is_confirmed == false }
  end
  
  def payment_method
    
  end
  
  def payment_confirmation
    
  end
  
  def thanks_message
    
  end
  
  
end
