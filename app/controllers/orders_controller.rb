class OrdersController < ApplicationController


  before_action :barman_redirect, except: [:current_orders, :show]
  before_action :set_order, except: [:account, :my_archives, :current_orders]

  def show
  end

  def current_orders
    @orders = Order.all.where(is_delivered: false)
  end

  def payment_method
    @order.is_confirmed = true
    @order.save!
  end

  def payment_confirmation
  end

  def thanks_message
    @order.is_paid = true
    @order.save!
  end

  def account
    @current_order = Order.find_by(user_id: current_user.id, is_paid: true, is_delivered: false)
    @orders = current_user.orders
    @user = current_user
  end

  def my_orders_notification
  end

  def my_orders
  end

  def my_archives
    @orders = Order.all.where(user_id: current_user.id)
  end


  def profile
  end

  def destroy
    @order.destroy
    redirect_to root_path
  end

  def update
    @order.update(order_params)
    redirect_to order_path(@order)
  end
  

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def barman_redirect
    redirect_to current_orders_path if current_user.is_barman
  end
  
  def order_params
    params.require(:order).permit(:is_confirmed, :is_delivered, :user_id, :is_paid)
  end
  
end
