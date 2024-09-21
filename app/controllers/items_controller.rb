# frozen_string_literal: true

class ItemsController < ApplicationController
  def index
    @items = Item.with_attached_image.all
  end

  def show
    @item = Item.with_attached_image.find(params[:id])
    @recent_items = Item.with_attached_image.order(created_at: :desc).limit(4)
  end
end
