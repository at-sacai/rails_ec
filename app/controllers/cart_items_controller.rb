class CartItemsController < ApplicationController
  def index; end

  def create; end

  def destroy; end

  private

  def current_cart
    if session[:cart_id]
      @cart = Cart.find(session[:cart_id])
    else
      @cart = Cart.create
      session[:cart_id] = @cart.id
    end
  end
end
