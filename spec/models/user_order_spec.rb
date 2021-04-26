require 'rails_helper'

RSpec.describe UserOrder, type: :model do
    before do
      @user_order = FactoryBot.build(:user_order)
    end

    context '購入ができる時' do
      it '全ての情報があれば出品できる' do
        @user_order= FactoryBot.build(:user_order)
      end
    end

   context '登録ができない' do
    
      it "tokenが空では登録できないこと" do
        @user_order.token = ''
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Token can't be blank")
      end

      it 'postnoが空だと保存できないこと' do
        @user_order.postno = ''
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include "Postno can't be blank"
      end
      it 'postnoが000-0000の半角形式でないと保存できないこと' do
        @user_order.postno= 1231234
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include "Postno is invalid"
      end
      it 'postnoが数字でないと保存できないこと' do
        @user_order.postno= 'あああ'
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include "Postno is invalid"
      end
      it '都道府県について情報がないと登録できない' do
        @user_order.area_id = ''
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include 'Area is not a number'
      end
      it '都道府県の情報が’１’の時は登録できない' do
        @user_order.area_id = 1
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include 'Area must be other than 1'
      end 
      it 'addressが空だと保存できないこと' do
        @user_order.address = ''
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include "Address can't be blank"
      end
      it 'addressが半角だと保存できないこと' do
        @user_order.address = 'aaa'
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include "Address is invalid"
      end
      it 'streetが空だと保存できないこと' do
        @user_order.street = ''
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include "Street can't be blank"
      end
      it 'streetが半角だと保存できないこと' do
        @user_order.street = 'aaa'
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include "Street is invalid"
      end
      it 'tellが空だと保存できないこと' do
        @user_order.tell = ''
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include "Tell can't be blank"
      end
      it '電話番号に半角以外入っていると保存できないこと' do
        @user_order.tell = 'あああああ'
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include "Tell is invalid"
      end
      it '電話番号が１１桁以上だと保存できない' do
        @user_order.tell = 11111111111111111111111
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include "Tell must be less than or equal to 11"
      end
    end



end