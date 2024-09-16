# frozen_string_literal: true

class AddImageColumnItems < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :image, :string, null: false, default: ''
  end
end
