FactoryBot.define do
  factory :user_order do
    postno { "111-1111" }
    area_id  { 2 }
    address { '中野' }
    street{ '所沢市1-1' }
    tell { '0805690513' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
