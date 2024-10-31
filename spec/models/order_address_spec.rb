require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item, user: @user)
    @order_address = FactoryBot.build(:order_address, user: @user, item: @item)
  end

  describe '商品購入機能' do
    context 'データが保存できるとき' do
      it '全ての必須項目が存在すれば保存できる' do
        expect(@order_address).to be_valid
      end
    end
    context 'データが保存できないとき' do
      it 'post_codeが空では登録できない' do
        @order_address.post_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Post code can't be blank"
      end
      it 'post_codeがハイフンなしの場合は登録できない' do
        @order_address.post_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it 'post_codeが4桁以上の場合は登録できない' do
        @order_address.post_code = '1234-5678'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it 'post_codeが2桁以下の場合は登録できない' do
        @order_address.post_code = '12-34'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it 'post_codeが全角の場合は登録できない' do
        @order_address.post_code = '１２３-４５６７'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it 'shopping_origin_idが空では登録できない' do
        @order_address.shopping_origin_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Shopping origin can't be blank"
      end
      it 'cityが空では登録できない' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "City can't be blank"
      end
      it 'street_addresが空では登録できない' do
        @order_address.street_address = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Street address can't be blank"
      end
      it 'phone_numberが空では登録できない' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Phone number can't be blank"
      end
      it 'phone_numberが10桁未満の場合は登録できない' do
        @order_address.phone_number = '123456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number must be 10 or 11 digits")
      end
      it 'phone_numberが12桁以上の場合は登録できない' do
        @order_address.phone_number = '123456789012'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number must be 10 or 11 digits")
      end
      it 'phone_numberが半角数値でない場合は登録できない' do
        @order_address.phone_number = '０９０１２３４５６７８'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number must be 10 or 11 digits")
      end
      it 'itemが紐づいていなければ保存できない' do
        @order_address.item_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "item can't be blank"
      end
      it 'userが紐づいていなければ保存できない' do
        @order_address.user_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "user can't be blank"
      end
    end
  end
end
