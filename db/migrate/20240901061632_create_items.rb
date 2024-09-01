class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.references :user
      t.string :item_name
      t.text :description
      t.integer :category_id
      t.integer :status_id
      t.integer :fee_id
      t.integer :area_id
      t.integer :day_id
      t.integer :price
      t.timestamps
    end
  end
end
