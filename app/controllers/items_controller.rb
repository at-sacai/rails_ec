class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def create
    Item.create(item_params)
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :sku, :description, :image)
  end
end
