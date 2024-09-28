# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_cart
  helper_method :set_cart

  def set_cart
    unless session[:cart_id]
      @cart = Cart.create
      session[:cart_id] = @cart.id
    end
    @cart = Cart.find_by(id: session[:cart_id])
  end
end
