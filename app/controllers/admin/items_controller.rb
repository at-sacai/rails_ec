class Admin::ItemsController < ApplicationController
  before_action :basic_auth

  def index
    @items = Item.all
  end

  def new
  end

  def create
  end

  def edit
  end

  def destroy
      @item = Item.find(params[:id])
      @item.destroy
      flash[:success] = 'Deletion completed'
      redirect_to admin_items_path, status: :see_other
  end

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end
end
