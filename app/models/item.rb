class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :area,:category,:status,:elivery_burden,:shipping_day
   has_one_attached :image

   with_options presence: true do
      validates :name
      validates :explanation,length: { maximum:1000 }
      validates :image
   end

   with_options numericality: { other_than: 1 }  do
    validates :category_id
    validates :status_id
    validates :delivery_burden_id
    validates :shipping_day_id
    validates :area_id
  end

    validates :price, inclusion: { in: 300..9_999_999 },format: { with: /\A[0-9]+\z/} 


end
