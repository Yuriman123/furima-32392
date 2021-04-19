class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_day
  belongs_to :delivery_burden
  has_one_attached :image
  belongs_to :user

  with_options presence: true do
    validates :name
    validates :explanation, length: { maximum: 1000 }
    validates :image
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :delivery_burden_id
    validates :shipping_day_id
    validates :area_id
  end

  validates :price, inclusion: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/ }
end
