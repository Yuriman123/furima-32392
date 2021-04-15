class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|

      t.timestamps
      
      t.string  :nickname,         null:false
      t.text    :explanation,      null:false
      t.integer :category_id,      null:false
      t.integer :status_id,        null: false
      t.integer :delivery_burden_id, null: false
      t.integer :area_id,          null: false
      t.integer :shipping_day_id,  null: false
      t.integer :price,            null: false
      t.references :user,          foreign_key: true
    end
  end
end
