class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.integer :price, null: false
      t.text :explanation, null: false
      t.boolean :is_saled, null: false, default: true
      t.timestamps
    end
  end
end
