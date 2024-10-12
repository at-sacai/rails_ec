# frozen_string_literal: true

class CouponsController < ApplicationController
  def create
    unless Coupon.exists?(code: params[:code])
      flash[:alert] = 'Invalide Coupon.'
      redirect_to cart_path
      return
    end

    @coupon = Coupon.find_by(code: params[:code])
    if @coupon.order_id
      flash[:alert] = 'Applied Coupon.'
    else
      session[:coupon_code] = params[:code]
      flash[:notice] = 'Valide Coupon.'
    end
    redirect_to cart_path
  end
end
