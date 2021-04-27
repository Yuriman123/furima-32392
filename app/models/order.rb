class Order < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :mailingaddress
  attr_accessor :token
  

end
