class AddUserIdToKindergarten < ActiveRecord::Migration[5.0]
  def change
    add_column :kindergartens, :user_id, :integer
  end
end
