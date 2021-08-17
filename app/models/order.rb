class Order < ApplicationRecord
  belongs_to :user
  has_many :order_lists, dependent: :destroy
  has_many :items, through: :order_lists

  validates :is_confirmed, presence: true
  validates :is_delivered, presence: true
end
