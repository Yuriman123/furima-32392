class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :baylogs


  validates :nickname, presence:true
  validates :email, presence:true
  validates :password, presence:true
  validates :firstname, presence:true
  validates :familyname, presence:true
  validates :firstname_kana, presence:true
  validates :familyname_kana, presence:true
  validates :birthday, presence:true

end
