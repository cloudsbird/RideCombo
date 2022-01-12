class CreateItemsAndDiscount < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :code, :name
      t.float :price
      t.timestamps
    end

    create_table :discounts do |t|
      t.string :type
      t.integer :min_items
      t.float :value
      t.references :item, foreign_key: true
      t.boolean :status, default: true
      t.timestamps
    end
  end
end
