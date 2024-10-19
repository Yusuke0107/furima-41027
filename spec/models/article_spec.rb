require 'rails_helper'

RSpec.describe Article, type: :model do
  before do
    @article = FactoryBot.build(:article)
  end

  describe '商品出品機能' do
    context '出品ができるとき' do
      it '全ての必須項目が存在すれば登録できる' do
        expect(@article).to be_valid
      end
    end
    context '出品ができないとき' do
      it 'category_idが空では登録できない' do
        @article.category_id = ''
        @article.valid?
        expect(@article.errors.full_messages).to include "Category can't be blank"
      end
      it 'condition_idが空では登録できない' do
        @article.condition_id = ''
        @article.valid?
        expect(@article.errors.full_messages).to include "Condition can't be blank"
      end
      it 'shopping_cost_idが空では登録できない' do
        @article.shopping_cost_id = ''
        @article.valid?
        expect(@article.errors.full_messages).to include "Shopping cost can't be blank"
      end
      it 'shopping_origin_idが空では登録できない' do
        @article.shopping_origin_id = ''
        @article.valid?
        expect(@article.errors.full_messages).to include "Shopping origin can't be blank"
      end
      it 'shopping_day_idが空では登録できない' do
        @article.shopping_day_id = ''
        @article.valid?
        expect(@article.errors.full_messages).to include "Shopping day can't be blank"
      end
      it 'category_idが1の場合は登録できない' do
        @article.category_id = 1
        @article.valid?
        expect(@article.errors.full_messages).to include "Category can't be blank"
      end
      it 'condition_idが1の場合は登録できない' do
        @article.condition_id = 1
        @article.valid?
        expect(@article.errors.full_messages).to include "Condition can't be blank"
      end
      it 'shopping_cost_idが1の場合は登録できない' do
        @article.shopping_cost_id = 1
        @article.valid?
        expect(@article.errors.full_messages).to include "Shopping cost can't be blank"
      end
      it 'shopping_origin_idが1の場合は登録できない' do
        @article.shopping_origin_id = 1
        @article.valid?
        expect(@article.errors.full_messages).to include "Shopping origin can't be blank"
      end
      it 'shopping_day_idが1の場合は登録できない' do
        @article.shopping_day_id = 1
        @article.valid?
        expect(@article.errors.full_messages).to include "Shopping day can't be blank"
      end