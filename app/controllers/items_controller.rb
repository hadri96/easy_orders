class ItemsController < ApplicationController


  before_action :set_item, only: [:show, :edit, :update, :destroy]
  # skip_before_action :authenticate_user!, only:[:index, :show]

  def index
    if params[:query].present?
      @items = Item.similarity_like(params[:query])
    else
      @items = Item.all
    end
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
    params.require(:ingredient).permit(:photo)
  end

end
