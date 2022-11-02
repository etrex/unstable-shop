class CreateSettings < ActiveRecord::Migration[6.1]
  def change
    create_table :settings do |t|
      t.string :key
      t.float :value

      t.timestamps
    end
  end
end
