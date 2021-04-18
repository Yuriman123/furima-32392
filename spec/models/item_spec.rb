require 'rails_helper'

RSpec.describe Item, type: :model do

  before do
    @item = FactoryBot.build(:item)
  end


  context '投稿ができる時' do
    it '全ての情報があれば出品できる' do
      @item = FactoryBot.build(:item)
    end
    it '価格の範囲が、¥300~¥9,999,999の間なら登録できる' do
      @item.price =300
      expect(@item).to be_valid
    end
  end


  context '投稿ができない時' do
    it '画像がないと登録できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include "Image can't be blank"
    end

    it '商品名がないと登録できない' do
      @item.name =''
      @item.valid?
      expect(@item.errors.full_messages).to include "Name can't be blank"
    end
    it '商品の説明が１０００文字超えると登録できない' do
      @item.explanation  = ('a'*10001)
      @item.valid?
      expect(@item.errors.full_messages).to include "Explanation is too long (maximum is 1000 characters)"
    end
    it '商品の説明がないと登録できない' do
      @item.explanation  =''
      @item.valid?
      expect(@item.errors.full_messages).to include "Explanation can't be blank"
    end
    it 'カテゴリーの情報がないと登録できない' do
      @item.category_id =''
      @item.valid?
      expect(@item.errors.full_messages).to include "Category is not a number"
    end
    it 'カテゴリーの情報が’１’の時は登録できない' do
      @item.category_id =1
      @item.valid?
      expect(@item.errors.full_messages).to include "Category must be other than 1"
    end
    it '商品の状態の情報がないと登録できない' do
      @item.status_id =''
      @item.valid?
      expect(@item.errors.full_messages).to include "Status is not a number"
    end
    it '商品の情報が’１’の時は登録できない' do
      @item.status_id =1
      @item.valid?
      expect(@item.errors.full_messages).to include "Status must be other than 1"
    end
    it '配送料の負担について情報がないと登録できない' do
      @item.delivery_burden_id =''
      @item.valid?
      expect(@item.errors.full_messages).to include "Delivery burden is not a number"
    end
    it '配送料の負担についての情報が’１’の時は登録できない' do
      @item.delivery_burden_id =1
      @item.valid?
      expect(@item.errors.full_messages).to include "Delivery burden must be other than 1"
    end
    it '配送もとの地域について情報がないと登録できない' do
      @item.area_id =''
      @item.valid?
      expect(@item.errors.full_messages).to include "Area is not a number"
    end
    it '配送もとの地域の情報が’１’の時は登録できない' do
      @item.area_id =1
      @item.valid?
      expect(@item.errors.full_messages).to include "Area must be other than 1"
    end
    it '発送までの日数について情報がないと登録できない' do
      @item.shipping_day_id =''
      @item.valid?
      expect(@item.errors.full_messages).to include "Shipping day is not a number"
    end
    it '発送までの日数についての情報が’１’の時は登録できない' do
      @item.shipping_day_id =1
      @item.valid?
      expect(@item.errors.full_messages).to include "Shipping day must be other than 1"
    end
  
    it '価格について299円の時は登録できない' do
      @item.price =299
      @item.valid?
      expect(@item.errors.full_messages).to include "Price is not included in the list"
    end
    it '価格について10,000,000円の時は登録できない' do
      @item.price =10000000
      @item.valid?
      expect(@item.errors.full_messages).to include "Price is not included in the list"
    end
    it '販売価格は半角数字のみでないと登録できない' do
      @item.price ='あああ'
      @item.valid?
      expect(@item.errors.full_messages).to include "Price is not included in the list"
    end

  end
end
