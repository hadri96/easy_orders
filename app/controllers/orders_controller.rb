class OrdersController < ApplicationController

  before_action :find_ID, except: [:account, :my_archives]

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
    @order.is_paid = true
    @order.save!
  end

  def account
    @current_order = Order.find_by(user_id: current_user.id, is_paid: true, is_delivered: false)
    @orders = current_user.orders
    @user = current_user
  end

  def my_orders_notification
    # @user = current_user.id
    @order = Order.find(params[:id])
  end

  def my_orders
    @order = Order.find(params[:id])
  end

  def my_archives
    @orders = Order.all.where(user_id: current_user.id)
  end


  def profile
    @order = Order.find(params[:id])
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to root_path
  end

  private

  def find_ID
    @order = Order.find(params[:id])
  end
  
end
