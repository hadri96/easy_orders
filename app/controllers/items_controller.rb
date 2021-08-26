class ItemsController < ApplicationController


  before_action :set_item, only: [:show, :edit, :update, :destroy]
  # skip_before_action :authenticate_user!, only:[:index, :show]

  def index
    @current_order = Order.find_by(user_id: current_user.id, is_paid: true, is_delivered: false)
    if params[:query].present?
      @items = Item.similarity_like(params[:query])
    else
      @items = Item.all
    end
    @categories = @items.group(:category).count.keys
    @order = Order.find_by(user_id: current_user, is_confirmed: false)
  end

  def show
      @order = Order.find_or_create_by(is_confirmed: false, user_id: current_user.id) do |order|
          order.is_confirmed = false
          order.is_delivered = false
          order.is_paid = false
          order.user_id = current_user.id
      end
      @order_list = OrderList.find_or_initialize_by(item_id: @item.id, order_id: @order.id)
  end

  def new
    @item = Item.new
    @ingredients = Ingredient.all
  end

  def create
    @item = Item.new(item_params)
    #@item.user = current_user
    if @item.save
      @ingredients = params['item']['ingredient'].each do |ingredient|
        ingredient = Ingredient.find_or_create_by(name: ingredient)
        IngredientList.new(ingredient_id: ingredient.id, item_id: @item.id).save!
      end
      redirect_to item_path(@item)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @item.update(item_params)
    redirect_to items_path
  end

  def destroy
    @item.destroy
    redirect_to items_path
  end

  def my_items
    @items = current_user.items
  end


  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :item_price, :item_description, :photo, :ingredient)
  end

  def ingredient_params
    params.require(:ingredient).permit(:photo)
  end

end
