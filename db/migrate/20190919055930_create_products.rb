class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :product_name, :null => false
      t.string :cd_type, :null => false
      t.references :artist, foreign_key: true, :null => false
      t.string :jacket_image_id
      t.integer :price, :null => false
      t.integer :label_id, foreign_key: true, :null => false
      t.integer :genre_id, foreign_key: true, :null => false
      t.string :stock, :null => false
      t.string :sell_status, :null => false
      t.datetime :sold_at, :null => false

      t.timestamps
    end
    add_index :products, :product_name
    add_index :products, :artist
  end
end
