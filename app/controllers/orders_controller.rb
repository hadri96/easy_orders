class OrdersController < ApplicationController
  def show
    @user = User.find(params[user_id])
    @orders = @user.orders.select { |order| order.is_confirmed == false }
  end
  
  def payment_method
    
  end
  
  def payment_confirmation
    
  end
  
  def thanks_message
    
  end
  
  
end
