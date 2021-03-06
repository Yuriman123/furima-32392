class UserOrder
  include ActiveModel::Model
  attr_accessor :postno, :area_id, :address, :street, :building, :tell, :item_id, :user_id, :token

  with_options presence: true do
    validates :postno, format: { with: /\A\d{3}-\d{4}\z/ }
    validates :area_id, numericality: { other_than: 1 }
    validates :address, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
    validates :street
    validates :tell, format: { with: /\A\d{10,11}\z/ }
    validates :token
    validates :user_id
    validates :item_id
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    mailingaddress = Mailingaddress.create(postno: postno, area_id: area_id, address: address, street: street,
                                           building: building, tell: tell, order_id: order.id)
  end
end
