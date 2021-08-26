class OrdersController < ApplicationController

  before_action :set_order, except: [:account, :my_archives, :current_orders]
  before_action :barman_redirect, except: [:current_orders, :show, :update]
  before_action :current_order

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
    @order.is_paid = true
    @order.save!
  end

  def thanks_message
  end

  def account
    @orders = current_user.orders
    @user = current_user
  end

  def my_orders_notification
  end

  def my_orders
    if @order.in_preparation
      redirect_to my_orders_notification_path(@order)
    end
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
    redirect_to current_orders_path
  end


  private

  def set_order
    @order = Order.find(params[:id])
  end

  def barman_redirect
    redirect_to current_orders_path if current_user.is_barman
  end

  def order_params
    params.require(:order).permit(:is_confirmed, :is_delivered, :user_id, :is_paid, :in_preparation)
  end

  def current_order
    @current_order = Order.find_by(user_id: current_user.id, is_paid: true, is_delivered: false, in_preparation: false)
  end
end
