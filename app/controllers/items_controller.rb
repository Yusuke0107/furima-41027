class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.user_id = current_user.id
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:user_id, :image, :item_name, :description, :category_id, :condition_id, :shopping_cost_id,
                                 :shopping_origin_id, :shopping_day_id, :price)
  end
end
