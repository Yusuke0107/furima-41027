require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
end

describe '商品出品機能' do
  context '出品ができるとき' do
    it '全ての必須項目が存在すれば登録できる' do
      expect(@item).to be_valid
    end
    it 'priceが300以上9999999以下であれば登録できる' do
      @item.price = 300
      expect(@item).to be_valid
      @item.price = 9999999
      expect(@item).to be_valid
    end
  end
  context '出品ができないとき' do
    it 'item_nameが空では登録できない' do
      @item.item_name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Item name can't be blank"
    end
    it 'descriptionが空では登録できない' do
      @item.description = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Description can't be blank"
    end
    it 'category_idが空では登録できない' do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Category can't be blank"
    end
    it 'condition_idが空では登録できない' do
      @item.condition_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Condition can't be blank"
    end
    it 'shopping_cost_idが空では登録できない' do
      @item.shopping_cost_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Shopping cost can't be blank"
    end
    it 'shopping_origin_idが空では登録できない' do
      @item.shopping_origin_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Shopping origin can't be blank"
    end
    it 'shopping_day_idが空では登録できない' do
      @item.shopping_day_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Shopping day can't be blank"
    end
    it 'priceが空では登録できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "price can't be blank"
    end
    it 'priceが299では登録できない' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include 'Price must be greater than or equal to 300'
    end
    it 'priceが10000000では登録できない' do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include 'Price must be less than or equal to 9999999'
    end
    it 'priceがアルファベットの場合は登録できない' do
      @item.price = 'abc'
      @item.valid?
      expect(@item.errors.full_messages).to include 'Price is not a number'
    end
    it 'priceが全角数値の場合は登録できない' do
      @item.price = '１２３'
      @item.valid?
      expect(@item.errors.full_messages).to include 'Price is not a number'
    end
    it 'priceが整数でない場合は登録できない' do
      @item.price = '100.5'
      @item.valid?
      expect(@item.errors.full_messages).to include 'Price must be an integer'
    end
    it 'category_idが1の場合は登録できない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include "Category can't be blank"
    end
    it 'condition_idが1の場合は登録できない' do
      @item.condition_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include "Condition can't be blank"
    end
    it 'shopping_cost_idが1の場合は登録できない' do
      @item.shopping_cost_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include "Shopping cost can't be blank"
    end
    it 'shopping_origin_idが1の場合は登録できない' do
      @item.shopping_origin_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include "Shopping origin can't be blank"
    end
    it 'shopping_day_idが1の場合は登録できない' do
      @item.shopping_day_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include "Shopping day can't be blank"
    end
    it 'userが紐づいていない場合は出品できない' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include "User must exist"
    end
  end