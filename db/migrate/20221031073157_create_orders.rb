class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.string :state, null: false
      t.integer :total_price, null: false

      t.timestamps
    end
  end
end
