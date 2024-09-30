# frozen_string_literal: true

class CartItemsController < ApplicationController
  def index
    @total_price = 0
    @cart.cart_items.each do |cart_item|
      @total_price += cart_item.calculate_price
    end
  end

  def create
    quantity = params[:quantity] || 1

    @cart_item = @cart.cart_items.find_or_initialize_by(item_id: params[:id])
    @cart_item.quantity ||= 0
    @cart_item.quantity += quantity.to_i

    if @cart_item.save
      flash[:notice] = 'Added to Cart Complete'
      redirect_to root_path
    else
      flash[:alert] = 'Added to Cart Failed. Please try again.'
      redirect_to request.referer
    end
  end

  def destroy
    @cart_item = CartItem.find_by(id: params[:id])
    @cart_item.destroy
    redirect_to request.referer
  end
end
