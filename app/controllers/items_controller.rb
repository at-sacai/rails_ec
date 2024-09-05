class ItemsController < ApplicationController
  def index
    @items = Item.with_attached_image.all
  end

  def show
    @item = Item.find(params[:id])
    @recent_items = Item.with_attached_image.order(created_at: :desc).limit(4)
  end

  def create
    Item.create(item_params)
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :sku, :description, :image)
  end
end
