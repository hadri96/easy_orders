class OrderListsController < ApplicationController
  before_action :set_order_list, only: [ :destroy]

  def create
      @order = Order.find_or_create_by(is_confirmed: false, user_id: current_user.id) do |order|
          order.is_confirmed = false
          order.is_delivered = false
          order.user_id = current_user.id
      end
      @order_list = OrderList.find_by(order_id: @order.id, item_id: params['order_list']['item_id'].to_i)
      if @order_list.nil?
          if params['order_list']['item_quantity'].to_i > 0
              @order_list = OrderList.create!(order_id: @order.id, item_id: params['order_list']['item_id'].to_i, item_quantity: params['order_list']['item_quantity'].to_i)
          end
      else
          if params['order_list']['item_quantity'].to_i > 0
              @order_list.update_attribute('item_quantity', params['order_list']['item_quantity'].to_i)
          else
              @order_list.destroy
          end
      end

      if !@order.order_lists.empty?
          redirect_back fallback_location: items_path
      else
        redirect_to items_path
      end

  end

  def destroy
    @order_list.destroy
    redirect_to items_path
  end

  private

  def order_list_params
    params.require(:order_list).permit(:item_id, :order_id, :item_quantity)
  end

  def set_order_list
    @order_list = OrderList.find(params[:id])
  end
end
