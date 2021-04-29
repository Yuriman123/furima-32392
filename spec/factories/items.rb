FactoryBot.define do
  factory :item do
    association :user 
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

    name                { '商品名' }
    explanation         { '説明文説明文' }
    category_id         { 2 }
    status_id           { 2 }
    delivery_burden_id  { 2 }
    area_id             { 2 }
    shipping_day_id     { 2 }
    price               { 333 }
  end
end
