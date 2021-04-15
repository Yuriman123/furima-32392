class Item < ApplicationRecord

  with_options presence: true do

    validates :nickname,         null:false
    validates :explanation,      null:false
    validates :category_id,      null:false
    validates :status_id,        null: false
    validates :delivery_burden_id, null: false
    validates :area_id,          null: false
    validates :shipping_day_id,  null: false
    validates :price,            null: false
  end

    validates :user,          foreign_key: true


end
