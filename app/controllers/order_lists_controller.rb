class OrderListsController < ApplicationController

  def create
      @order = Order.find_or_create_by(is_confirmed: false, user_id: current_user.id) do |order|
        order.is_confirmed = false
        order.is_delivered = false
        order.user_id = current_user.id
      end
      @order_list = OrderList.find_by(order_id: @order.id, item_id: params['order_list']['item_id'].to_i)
      if @order_list.nil?
        @order_list = OrderList.create!(order_id: @order.id, item_id: params['order_list']['item_id'].to_i, item_quantity: params['order_list']['item_quantity'].to_i)
      else
        @order_list.update_attribute('item_quantity', params['order_list']['item_quantity'].to_i)
      end
      redirect_to items_path
    end
end
