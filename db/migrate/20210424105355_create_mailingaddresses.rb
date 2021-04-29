class CreateMailingaddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :mailingaddresses do |t|
      t.string :postno,   null: false
      t.integer :area_id,  null: false
      t.string :address,  null: false
      t.string :street,   null: false
      t.string :building
      t.string :tell,     null: false
      t.references :order, foreign_key: true

      t.timestamps
    end
  end
end
