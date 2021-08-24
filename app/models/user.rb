class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable

  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i[facebook]
  has_one_attached :photo
  has_one_attached :avatar
  has_many :orders

  def has_on_going_order?
    if self.orders.last.is_confirmed == true && self.orders.last.is_delivered == false
      return true
    end 
  end
end
