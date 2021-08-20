class PagesController < ApplicationController
  def home
    @order = Order.find(params[:id])
  end
end
