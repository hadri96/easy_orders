class ItemsController < ApplicationController


  before_action :set_item, only: [:show, :edit, :update, :destroy]
  # skip_before_action :authenticate_user!, only:[:index, :show]

  def index
    if params[:query].present?
      @items = Item.similarity_like(params[:query])
    else
      @items = Item.all
    end

    @categories = @items.group(:category).count.keys
  end

  def show
    # @order = Order.new
  end

  def new
    @item = Item.new
    @ingredients = Ingredient.all
  end

  def create
    @item = Item.new(item_params)
    raise
    @item.user = current_user
    if @item.save
      redirect_to item_path(@item)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @item.update(item_params)
    redirect_to item_path(@item)
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
    params.require(:ingredient).permit(:name)
  end

end
