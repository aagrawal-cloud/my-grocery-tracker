class CreatePantries < ActiveRecord::Migration[6.0]
  def change
    create_table :pantries do |t|
      t.integer :item_id
      t.string :quantity
      t.string :quantity_value
      t.integer :list_id
      t.integer :user_id

      t.timestamps
    end
  end
end
