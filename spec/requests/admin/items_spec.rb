# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Admin::Items' do
  describe 'GET /index' do
    it 'returns http success' do
      get '/admin/items/index'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get '/admin/items/show'
      expect(response).to have_http_status(:success)
    end
  end
end
