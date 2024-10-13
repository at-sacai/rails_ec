# frozen_string_literal: true

class OrdersController < ApplicationController
  def create
    @order = Order.new(order_params)
    @coupon = Coupon.find_by(code: session[:coupon_code])
    @order.total_price = @cart.cart_items.sum(&:calculate_price) - (@coupon&.discount_price || 0)

    ApplicationRecord.transaction do
      @cart.cart_items.each do |cart_item|
        @order.order_items.build(item_id: cart_item.item_id, quantity: cart_item.quantity)
      end
      if @order.save
        apply_coupon if @coupon
        PurchaseMailer.with(order: @order).thanks_email.deliver_now
        flash[:notice] = 'Purchase Complete.'
        clear_session
        redirect_to root_path
      else
        flash[:alert] = 'Purchase Failed.'
        @messages = @order.errors
        render template: 'cart_items/index', status: :unprocessable_entity
      end
    end
  rescue ActiveRecord::RecordInvalid
    clear_session
    flash[:alert] = 'Purchase Failed. Please Start Over.'
    redirect_to root_path
  end

  private

  def order_params
    params.require(:order).permit(:first_name, :last_name, :email, :address, :address_2, :country, :state, :zip)
  end

  def clear_session
    session.delete(:cart_id)
    session.delete(:coupon_code)
    @cart.destroy
  end

  def apply_coupon
    @coupon.order_id = @order.id
    @coupon.save!
  end
end
