module Admin
  class OrderItemsController < ApplicationController
    def index
      @orders = Order.all
    end

    def show
      @order = Order.find_by(id: params[:id])
    end
  end
end
