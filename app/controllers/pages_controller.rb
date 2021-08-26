class PagesController < ApplicationController
  before_action :barman_redirect, except: [:current_orders]

  def home
    @current_order = Order.find_by(user_id: current_user.id, is_paid: true, is_delivered: false)
  end

  private

  def barman_redirect
    redirect_to current_orders_path if current_user.is_barman
  end
end
