class PagesController < ApplicationController
  def home
    @order = Order.find_by(user_id: current_user.id, is_paid: true, is_delivered: false)
  end
end
