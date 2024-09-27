require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it 'nicknameが空では登録できない' do
      user = User.new(nickname: '', email: 'test@example', password: '000000', password_confirmation: '000000', first_name: 'aaa', last_name: 'bbb', first_name_kana: 'aaa', last_name_kana: 'bbb', birth_date: '0000')
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      user = User.new(nickname: 'aaa', email: '', password: '000000', password_confirmation: '000000', first_name: 'aaa', last_name: 'bbb', first_name_kana: 'aaa', last_name_kana: 'bbb', birth_date: '0000')
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
    it 'first_nameが空では登録できない' do
      user = User.new(nickname: 'aaa', email: 'test@example', password: '000000', password_confirmation: '000000', first_name: '', last_name: 'bbb', first_name_kana: 'aaa', last_name_kana: 'bbb', birth_date: '0000')
      user.valid?
      expect(user.errors.full_messages).to include("First name can't be blank")
    end
    it 'last_nameが空では登録できない' do
      user = User.new(nickname: 'aaa', email: 'test@example', password: '000000', password_confirmation: '000000', first_name: 'aaa', last_name: '', first_name_kana: 'aaa', last_name_kana: 'bbb', birth_date: '0000')
      user.valid?
      expect(user.errors.full_messages).to include("Last name can't be blank")
    end
    it 'first_name_kanaが空では登録できない' do
      user = User.new(nickname: 'aaa', email: 'test@example', password: '000000', password_confirmation: '000000', first_name: 'aaa', last_name: 'bbb', first_name_kana: '', last_name_kana: 'bbb', birth_date: '0000')
      user.valid?
      expect(user.errors.full_messages).to include("First name kana can't be blank")
    end
    it 'last_name_kanaが空では登録できない' do
      user = User.new(nickname: 'aaa', email: 'test@example', password: '000000', password_confirmation: '000000', first_name: 'aaa', last_name: 'bbb', first_name_kana: 'aaa', last_name_kana: '', birth_date: '0000')
      user.valid?
      expect(user.errors.full_messages).to include("Last name kana can't be blank")
    end
    it 'birth_dateが空では登録できない' do
      user = User.new(nickname: 'aaa', email: 'test@example', password: '000000', password_confirmation: '000000', first_name: 'aaa', last_name: 'bbb', first_name_kana: 'aaa', last_name_kana: 'bbb', birth_date: 'nil')
      user.valid?
      expect(user.errors.full_messages).to include("Birth date can't be blank")
    end
  end
end
