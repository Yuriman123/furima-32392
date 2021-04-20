require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    context 'ユーザー登録ができる時' do
      it '全ての情報があれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上であれば登録できる' do
        @user.password = '0000aaa'
        @user.password_confirmation = '0000aaa'
        expect(@user).to be_valid
      end
    end

    context 'ユーザー登録ができない時' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank", 'Password is invalid'
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it '苗字が空だと登録できない' do
        @user.familyname_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Familyname kana can't be blank"
      end
      it '名前が空だと登録できない' do
        @user.firstname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Firstname can't be blank"
      end
      it '苗字（カタカナ）が空だと登録できない' do
        @user.familyname_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Familyname kana can't be blank"
      end
      it '名前（カタカナ）が空だと登録できない' do
        @user.firstname_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Firstname kana can't be blank"
      end
      it '生年月日が空だと登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Birthday can't be blank"
      end
      it 'passwodが6文字以下だと登録できない' do
        @user.password = '000a'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is too short (minimum is 6 characters)'
      end
      it 'パスワードは半角英数字混合入力がないとできない' do
        @user.password = 'aaaaaaaaa'
        @user.valid?
        expect(@user.errors[:password]).to include 'is invalid'
      end
      it 'passwordが数字のみでは登録できないこと' do
        @user.password = '11111111'
        @user.valid?
        expect(@user.errors[:password]).to include 'is invalid'
      end
      it 'passwordが全角では登録できないこと' do
        @user.password = 'あああああああ'
        @user.valid?
        expect(@user.errors[:password]).to include 'is invalid'
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include 'Email has already been taken'
      end
      it 'emaileに＠がない場合は登録ができない' do
        @user.email = 'samplegmail.com'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Email is invalid'
      end
      it '苗字（全角）が半角だと登録できない' do
        @user.familyname = 'aa'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Familyname に全角文字を使用してください'
      end
      it '名前（全角）が半角だと登録できない' do
        @user.firstname = 'aa'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Firstname に全角文字を使用してください'
      end
      it '苗字（カタカナが）カタカナ以外だと登録できない' do
        @user.familyname_kana = 'かな'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Familyname kana はカタカナで入力して下さい。'
      end
      it '名前（カタカナが）カタカナ以外だと登録できない' do
        @user.firstname_kana = 'かな'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Firstname kana はカタカナで入力して下さい。'
      end
    end
  end
end
