class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :area,:category,:status,:elivery_burden,:shipping_day
    has_one_attached :image

  with_options presence: true do

    validates :name
    validates :explanation

    validates :image,              numericality: { other_than: 1 } 
    validates :category_id,        numericality: { other_than: 1 } 
    validates :status_id,          numericality: { other_than: 1 } 
    validates :delivery_burden_id, numericality: { other_than: 1 } 
    validates :shipping_day_id,    numericality: { other_than: 1 } 
    validates :area_id,            numericality: { other_than: 1 } 

    validates :price, inclusion: { in: 300..9_999_999 },format: { with: /\A[0-9]+\z/} 
  end


end
