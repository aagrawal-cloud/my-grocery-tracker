class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :item_name
      t.integer :list_id
      t.float :quantity
      t.float :price
      t.string :quantity_value
      t.boolean :pantry_id

      t.timestamps
    end
  end
end
