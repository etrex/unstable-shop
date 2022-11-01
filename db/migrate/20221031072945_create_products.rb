class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.string :image_url, null: false
      t.integer :price, null: false

      t.timestamps
    end
  end
end
