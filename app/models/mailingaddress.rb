class Mailingaddress < ApplicationRecord
 belongs_to :order


  with_options presence: true do
    validates :postno
    validates :area_id
    validates :address
    validates :street
    validates :tell
  end
  
    validates :building
 

end
