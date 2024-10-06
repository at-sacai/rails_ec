module Admin
  class OrdersController < ApplicationController
    def index
      @orders = Order.all
    end

    def create
      @order = Order.new(order_params)
      @order.total_price = @cart.cart_items.sum { |cart_item| cart_item.calculate_price }

      ActiveRecord::Base.transaction do
        if @order.save
          @cart.cart_items.each do |cart_item|
            @order_item = OrderItem.new
            @order_item.order_id = @order.id
            @order_item.item_id = cart_item.item_id
            @order_item.quantity = cart_item.quantity
            @order_item.save
          end
          flash[:notice] = 'Purchase Complete.'
          clear_cart
          redirect_to root_path
        else
          flash[:alert] = 'Purchase Failed.'
          @messages = @order.errors
          render template: 'cart_items/index', status: :unprocessable_entity
        end
      rescue StandardError
        clear_cart
        flash[:alert] = 'Purchase Failed. Please Start Over.'
        redirect_to root_path
      end
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
end
