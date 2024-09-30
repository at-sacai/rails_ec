# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'CartItems' do
  describe 'GET /index' do
    it 'returns http success' do
      get '/cart_items/index'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /create' do
    it 'returns http success' do
      get '/cart_items/create'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /destroy' do
    it 'returns http success' do
      get '/cart_items/destroy'
      expect(response).to have_http_status(:success)
    end
  end
end
