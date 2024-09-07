class ChangeItemColumnToNullItems < ActiveRecord::Migration[7.0]
  def up
    change_column_null :items, :image, true
  end
end
