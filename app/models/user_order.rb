class UserOrder
  include ActiveModel::Model
  attr_accessor :postno, :area_id, :address, :street, :building, :tell,:image, :building, :item_id,:user_id,:token

  with_options presence: true do
    validates :postno
    validates :area_id
    validates :address
    validates :street
    validates :tell
    validates :token

  end
  
 def save
  # binding.pry
    order = Order.create(user_id: user_id, item_id: item_id)
    # pay = Pay .create(price: price,token: token)
    mailingaddress = Mailingaddress.create(postno: postno, area_id: area_id, address: address, street: street, building: building, tell: tell, order_id: order.id)
 end


end