class AddMoreDetailToKindergarten < ActiveRecord::Migration[5.0]
  def change
    add_column :kindergartens, :fee, :integer
    add_column :kindergartens, :phone, :integer
  end
end
