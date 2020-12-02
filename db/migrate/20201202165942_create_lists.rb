class CreateLists < ActiveRecord::Migration[6.0]
  def change
    create_table :lists do |t|
      t.integer :user_id
      t.integer :item_id
      t.string :list_name
      t.datetime :date
      t.integer :pantry_id
      t.integer :items_count

      t.timestamps
    end
  end
end
