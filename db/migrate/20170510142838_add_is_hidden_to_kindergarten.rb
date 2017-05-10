class AddIsHiddenToKindergarten < ActiveRecord::Migration[5.0]
  def change
    add_column :kindergartens, :is_hidden, :boolean, default: true
  end
end
