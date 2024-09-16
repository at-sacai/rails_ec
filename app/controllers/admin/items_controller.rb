# frozen_string_literal: true

module Admin
  class ItemsController < ApplicationController
    before_action :basic_auth

    def index
      @items = Item.with_attached_image.all
    end

    def new
      @item = Item.new
    end

    def edit
      @item = Item.with_attached_image.find(params[:id])
    end

    def create
      item = Item.new(item_params)
      unless item.image.attached?
        item.image.attach(io: Rails.root.join('app/assets/images/sample.png').open, filename: 'sample.png')
      end

      if item.save
        flash[:notice] = "「#{item.name}」Registration complete."
        redirect_to admin_items_path
      else
        flash[:alert] = 'Registration failed.'
        render 'new', status: :unprocessable_entity
      end
    end

    def update
      @item = Item.with_attached_image.find(params[:id])

      if @item.update(item_params)
        flash[:notice] = 'Update complete.'
        redirect_to admin_items_path
      else
        flash[:alert] = 'Update failed.'
        render :edit
      end
    end

    def destroy
      item = Item.with_attached_image.find(params[:id])
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
end
