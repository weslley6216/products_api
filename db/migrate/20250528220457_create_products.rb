class CreateProducts < ActiveRecord::Migration[8.0]
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price
      t.string :sku

      t.timestamps
    end

    add_index :products, :sku, unique: true
  end
end
