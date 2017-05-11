class CreateKindergartenRelationships < ActiveRecord::Migration[5.0]
  def change
    create_table :kindergarten_relationships do |t|
      t.integer :kindergarten_id
      t.integer :user_id

      t.timestamps
    end
  end
end
