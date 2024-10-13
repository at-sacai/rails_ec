# frozen_string_literal: true

class CouponsController < ApplicationController
  def create
    @coupon = Coupon.find_by(code: params[:code])
    if @coupon.nil?
      flash[:alert] = 'Invalide Coupon.'
      redirect_to cart_path
      return
    end

    if @coupon.order_id
      flash[:alert] = 'Applied Coupon.'
    else
      session[:coupon_code] = params[:code]
      flash[:notice] = 'Valide Coupon.'
    end
    redirect_to cart_path
  end
end
