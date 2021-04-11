require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do

    before do
      @user = FactoryBot.build(:user)
    end

    it 'nicknameが空では登録できない' do
      @user.nickname =''
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end
    it ' emailが空では登録できない' do
      @user.email =''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
    it 'passwordが空では登録できない' do
      @user.password =''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank", "Password is too short (minimum is 6 characters)"
    end
    it 'passwordが存在してもencrypted_passwordが空では登録できない' do
      @user.encrypted_password =''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end
    it '苗字が空だと登録できない' do
      @user.familyname_kana =''
      @user.valid?
      expect(@user.errors.full_messages).to include "Familyname kana can't be blank"
    end
    it '名前が空だと登録できない' do
      @user.firstname =''
      @user.valid?
      expect(@user.errors.full_messages).to include "Firstname can't be blank"
    end
    it '苗字（カタカナ）が空だと登録できない' do
      @user.familyname_kana =''
      @user.valid?
      expect(@user.errors.full_messages).to include "Familyname kana can't be blank"
    end
    it '名前（カタカナ）が空だと登録できない' do
      @user.firstname_kana =''
      @user.valid?
      expect(@user.errors.full_messages).to include "Firstname kana can't be blank"
    end
    it '生年月日が空だと登録できない' do
      @user.birthday =''
      @user.valid?
      expect(@user.errors.full_messages).to include "Birthday can't be blank"
    end
    it 'passwordが6文字以上であれば登録できる' do
      @user.password ='0000aaa'
      expect(@user).to be_valid
    end
    it 'passwodが6文字以下だと登録できない' do
      @user.password='000a'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
    end
    it 'パスワードは半角英数字混合入力が必須' do
      @user.password= 'aaaaaaaaa'
      @user.valid?
      expect(@user.errors[password]).to include "は６文字以上で半角と全角を使用してください)"
    end
    it '重複したemailが存在する場合登録できない' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include "has already been taken"
    end
    it 'emaileに＠がない場合は登録ができない' do
      @user.email='samplegmail.com'
      @user.valid?
      expect(@user.errors.full_messages).to include "Email is invalid"
    end
    it '苗字（全角）が半角だと登録できない' do
      @user.familyname='aa'
      @user.valid?
      expect(@user.errors.full_messages).to include "Familyname に全角文字を使用してください"
    end
    it '名前（全角）が半角だと登録できない' do
      @user.firstname='aa'
      @user.valid?
      expect(@user.errors.full_messages).to include "Firstname に全角文字を使用してください"
    end
    it '苗字（カタカナが）カタカナ以外だと登録できない' do
      @user.familyname_kana='かな'
      @user.valid?
      expect(@user.errors.full_messages).to include "Familyname kana はカタカナで入力して下さい。"
    end
    it '名前（カタカナが）カタカナ以外だと登録できない' do
      @user.firstname_kana='かな'
      @user.valid?
      expect(@user.errors.full_messages).to include "Firstname kana はカタカナで入力して下さい。"
    end
  end
end
