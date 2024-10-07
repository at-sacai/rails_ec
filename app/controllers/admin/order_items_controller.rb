module Admin
  class OrderItemsController < ApplicationController
    before_action :basic_auth
    def index
      @orders = Order.all
    end

    def show
      @order = Order.find_by(id: params[:id])
    end

    private

    def basic_auth
      authenticate_or_request_with_http_basic do |username, password|
        username == ENV['BASIC_AUTH_USER'] && password == ENV['BASIC_AUTH_PASSWORD']
      end
    end
  end
end
