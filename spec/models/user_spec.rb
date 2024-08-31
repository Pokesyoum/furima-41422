require 'rails_helper'

RSpec.describe User, type: :model do
  describe '新規登録/ユーザー情報' do
    it 'nicknameが空では登録できない' do
      @user = FactoryBot.build(:user)
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end
    it 'emailが空では登録できない' do
      @user = FactoryBot.build(:user)
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
    it '既に使用されているメールアドレスでは新規登録出来ない' do
      @user = FactoryBot.build(:user)
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include 'Email has already been taken'
    end
      @user = FactoryBot.build(:user)
      @user.email = 'test'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Email is invalid'
    end
    it 'passwordが空では登録できない' do
      @user = FactoryBot.build(:user)
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end
    it 'passwordが6字未満では登録できない' do
      @user = FactoryBot.build(:user)
      @user.password = 'test'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Password is too short (minimum is 6 characters)'
    end
    it 'passwordは半角英数混合でないと登録できない' do
      @user = FactoryBot.build(:user)
      @user.password = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Password must include both letters and numbers'
    end
    it 'passwordとpassword_confirmationが一致しないと登録できない' do
      @user = FactoryBot.build(:user)
      @user.password = '123456'
      @user.password_confirmation = '123457'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end
  end
  describe '新規登録/本人情報確認' do
    it 'last_nameが空では登録できない' do
      @user = FactoryBot.build(:user)
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name can't be blank"
    end
    it 'first_nameが空では登録できない' do
      @user = FactoryBot.build(:user)
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name can't be blank"
    end
    it 'last_nameが全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
      @user = FactoryBot.build(:user)
      @user.last_name = 'test'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Last name must be in full-width characters (Kanji, Hiragana, Katakana)'
    end
    it 'first_nameが全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
      @user = FactoryBot.build(:user)
      @user.first_name = 'test'
      @user.valid?
      expect(@user.errors.full_messages).to include 'First name must be in full-width characters (Kanji, Hiragana, Katakana)'
    end
    it 'last_kanaが空では登録できない' do
      @user = FactoryBot.build(:user)
      @user.last_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Last kana can't be blank"
    end
    it 'first_nameが空では登録できない' do
      @user = FactoryBot.build(:user)
      @user.first_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First kana can't be blank"
    end
    it 'last_kanaが全角（カタカナ）でなければ登録できない' do
      @user = FactoryBot.build(:user)
      @user.last_kana = 'てすと'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Last kana must be in full-width characters (Katakana)'
    end
    it 'first_kanaが全角（カタカナ）でなければ登録できない' do
      @user = FactoryBot.build(:user)
      @user.first_kana = 'てすと'
      @user.valid?
      expect(@user.errors.full_messages).to include 'First kana must be in full-width characters (Katakana)'
    end
    it 'birthdayが空では登録できない' do
      @user = FactoryBot.build(:user)
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Birthday can't be blank"
    end
  end
end
