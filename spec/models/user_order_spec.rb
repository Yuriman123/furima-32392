require 'rails_helper'

RSpec.describe UserOrder, type: :model do
  describe 'アドレスの登録' do
    before do
      @user_order = FactoryBot.build(:user_order)
    end

    context '登録ができる時' do
      it 'すべての値が正しく入力されていれば保存できること' do
      end
    end

    context '登録ができない' do

      it "priceとtokenがあれば保存ができること" do
        expect(@user_order).to be_valid
      end
    
      it "priceが空では登録できないこと" do
        @user_order.price = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Price can't be blank")
      end
    
      it "tokenが空では登録できないこと" do
        @user_order.token = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Token can't be blank")
      end

      it 'postnoが空だと保存できないこと' do
        @user_order.postno = ''
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include "Postno can't be blank"
      end
      it 'aria_idが全角日本語でないと保存できないこと' do
        @user_order.area_id = ''
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include "Area can't be blank"
      end
      it 'addressが空だと保存できないこと' do
        @user_order.address = ''
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include "Address can't be blank"
      end
      it 'streetが全角日本語でないと保存できないこと' do
        @user_order.street = ''
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include "Street can't be blank"
      end
      it 'tellが空だと保存できないこと' do
        @user_order.tell = ''
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include ""
      end
      it 'nicknameが半角でないと保存できないこと' do
      end
      it 'postal_codeが空だと保存できないこと' do
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      end
      it 'prefectureを選択していないと保存できないこと' do
      end
      it 'cityは空でも保存できること' do
      end
      it 'house_numberは空でも保存できること' do
      end
      it 'building_nameは空でも保存できること' do
      end
      it 'priceが空だと保存できないこと' do
      end
      it 'priceが全角数字だと保存できないこと' do
      end
      it 'priceが1円未満では保存できないこと' do
      end
      it 'priceが1,000,000円を超過すると保存できないこと' do
      end
    end
  end
end