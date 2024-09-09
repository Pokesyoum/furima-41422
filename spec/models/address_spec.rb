require 'rails_helper'

RSpec.describe Address, type: :model do
  before do
    @address = FactoryBot.build(:address)
  end

  describe '住所登録' do
    context '住所登録できるとき' do
      it 'すべての情報があれば登録できる' do
        expect(@address).to be_valid
      end
      it 'buildingがなくても登録できる' do
        @address.building = ''
        expect(@address).to be_valid
      end
    end
    context '住所登録できないとき' do
      it 'postal_codeがないと登録できない' do
        @address.postal_code = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeは3桁-4桁の形式でないと登録できない' do
        @address.postal_code = '1234567'
        @address.valid?
        expect(@address.errors.full_messages).to include('Postal code is invalid')
      end
      it 'ara_idが1だと登録できない' do
        @address.area_id = 1
        @address.valid?
        expect(@address.errors.full_messages).to include("Area can't be blank")
      end
      it 'cityがないと登録できない' do
        @address.city = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("City can't be blank")
      end
      it 'streetがないと登録できない' do
        @address.street = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("Street can't be blank")
      end
      it 'phone_numberがないと登録できない' do
        @address.phone_number = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone numberは10または11桁の数字でないと登録できない' do
        @address.phone_number = '123456789'
        @address.valid?
        expect(@address.errors.full_messages).to include('Phone number is invalid')
      end
    end
  end
end
