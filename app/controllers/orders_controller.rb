# frozen_string_literal: true

class OrdersController < ApplicationController
  def create
    @order = Order.new(order_params)
    @order.total_price = @cart.cart_items.sum(&:calculate_price)

    ApplicationRecord.transaction do
      if @order.save
        @cart.cart_items.each do |cart_item|
          @order_item = OrderItem.new
          @order_item.order_id = @order.id
          @order_item.item_id = cart_item.item_id
          @order_item.quantity = cart_item.quantity
          @order_item.save
        end
        PurchaseMailer.with(order: @order).thanks_email.deliver_now
        flash[:notice] = 'Purchase Complete.'
        clear_cart
        redirect_to root_path
      else
        flash[:alert] = 'Purchase Failed.'
        @messages = @order.errors
        render template: 'cart_items/index', status: :unprocessable_entity
      end
    end
  rescue ActiveRecord::RecordInvalid
    clear_cart
    flash[:alert] = 'Purchase Failed. Please Start Over.'
    redirect_to root_path
  end

  private

  def order_params
    params.require(:order).permit(:first_name, :last_name, :email, :address, :address_2, :country, :state, :zip)
  end

  def clear_cart
    session.delete(:cart_id)
    @cart.destroy
  end
end
