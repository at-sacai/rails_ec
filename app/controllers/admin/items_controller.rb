class Admin::ItemsController < ApplicationController
  before_action :basic_auth

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    item = Item.new(item_params)
    unless item.image.attached?
      item.image.attach(io: File.open(Rails.root.join('app/assets/images/sample.png')), filename: 'sample.png')
    end

    if item.save
      flash[:notice] = "「#{item.name}」Registration complete."
      redirect_to admin_items_path
    else
      flash[:alert] = 'Registration failed.'
      render 'new', status: :unprocessable_entity
    end
  end

  def edit; end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    flash[:notice] = 'Deletion complete.'
    redirect_to admin_items_path, status: :see_other
  end

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['BASIC_AUTH_USER'] && password == ENV['BASIC_AUTH_PASSWORD']
    end
  end

  def item_params
    params.require(:item).permit(:name, :price, :description, :image)
  end
end
