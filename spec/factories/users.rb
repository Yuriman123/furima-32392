FactoryBot.define do
  factory :user do
    nickname              { 'tarou' }
    email                 { 'sample@gmail.com' }
    password              { '1234aaaa' }
    password_confirmation { '1234aaaa' }
    familyname           { '山田' }
    familyname_kana      { 'ヤマダ' }
    firstname            { '太郎' }
    firstname_kana       { 'タロウ' }
    birthday             { '2000-01-01' }
  end
end
