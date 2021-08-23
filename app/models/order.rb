class Order < ApplicationRecord
  belongs_to :user
  has_many :order_lists, dependent: :destroy
  has_many :items, through: :order_lists

  def calculate_price
    # @total_price = @items.item_id.item_price * @order_lists.item_quantity 
    @total_price = order_lists.map { |order_list| order_list.item.item_price * order_list.item_quantity }.reduce(:+)
  end
  
  #validates :is_confirmed, presence: true
  #validates :is_delivered, presence: true
end
