class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :baylogs

  with_options presence: true do
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze

  validates :password,format:{with:PASSWORD_REGEX}
  validates :nickname
  validates :email
  validates :firstname, format: { with: /\A[ぁ-んァ-ン一-龥々一]+\z/, message: 'に全角文字を使用してください' }
  validates :familyname, format: { with: /\A[ぁ-んァ-ン一-龥々一]+\z/, message: 'に全角文字を使用してください' }
  validates :firstname_kana, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。'}
  validates :familyname_kana, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。'}
  validates :birthday

  end
end
