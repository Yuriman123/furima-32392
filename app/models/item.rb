class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area

  has_one_attached :image

  with_options presence: true do

    validates :nickname
    validates :explanation
    validates :category_id
    validates :status_id
    validates :delivery_burden_id
    validates :shipping_day_id
    validates :price
  end
    validates :area_id, numericality: { other_than: 1 } 
    validates :user


end
