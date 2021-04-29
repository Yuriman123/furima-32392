require 'rails_helper'

RSpec.describe UserOrder, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @user_order = FactoryBot.build(:user_order, user_id: @user.id, item_id: @item.id)
    sleep(1) # スリープで生成させてからでないとエラーが起きるため記述しています。
  end

  context '購入ができる時' do
    it '全ての情報があれば出品できる' do
      @user_order = FactoryBot.build(:user_order)
    end
    it '電話番号が１１桁だと登録できる' do
      @user_order.tell = '12345678901'
      expect(@user_order).to be_valid
    end
    it '建物名が空でも登録できる' do
      @user_order.building = ''
      expect(@user_order).to be_valid
    end
  end

  context '登録ができない' do
    it 'tokenが空では登録できないこと' do
      @user_order.token = ''
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Token can't be blank")
    end
    it 'user_idが空では登録できないこと' do
      @user_order.user_id = ''
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("User can't be blank")
    end
    it 'item_idが空では登録できないこと' do
      @user_order.item_id = ''
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Item can't be blank")
    end
    it 'postnoが空だと保存できないこと' do
      @user_order.postno = ''
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include "Postno can't be blank"
    end
    it 'postnoが000-0000の半角形式でないと保存できないこと' do
      @user_order.postno = 1_231_234
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include 'Postno is invalid'
    end
    it 'postnoが数字でないと保存できないこと' do
      @user_order.postno = 'あああ'
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include 'Postno is invalid'
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
      expect(@user_order.errors.full_messages).to include 'Address is invalid'
    end
    it 'streetが空だと保存できないこと' do
      @user_order.street = ''
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include "Street can't be blank"
    end

    it 'tellが空だと保存できないこと' do
      @user_order.tell = ''
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include "Tell can't be blank"
    end
    it '英数混合では登録できないこと' do
      @user_order.tell = '11aaaaaaaaa'
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include 'Tell is invalid'
    end

    it '電話番号に半角以外入っていると保存できないこと' do
      @user_order.tell = 'あああああ'
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include 'Tell is invalid'
    end
    it '電話番号が１2桁以上だと保存できない' do
      @user_order.tell = 11_111_111_111_111_111_111_111
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include 'Tell is invalid'
    end
  end
end
