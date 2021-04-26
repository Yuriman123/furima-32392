FactoryBot.define do
  factory :user_order do
    postno { 111-1111 }
    area_id { 1 }
    address{ '埼玉' }
    street{ '所沢市' }
    tell { '000-1111-2222' }
    price {3000}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
