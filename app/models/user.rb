class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :baylogs

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze

  validates :password,format:{with:PASSWORD_REGEX}
  validates :nickname, presence:true
  validates :email, presence:true,uniqueness: { case_sensitive: true }
  validates :encrypted_password, presence:true
  validates :firstname, presence:true,format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'に全角文字を使用してください' }
  validates :familyname, presence:true,format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'に全角文字を使用してください' }
  validates :firstname_kana, presence:true,format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。'}
  validates :familyname_kana, presence:true,format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。'}
  validates :birthday, presence:true

end
