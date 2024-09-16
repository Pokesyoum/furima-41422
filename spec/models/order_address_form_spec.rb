require 'rails_helper'

RSpec.describe OrderAddressForm, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_address_form = FactoryBot.build(:order_address_form, user_id: user.id, item_id: item.id)
  end

  describe '商品購入機能' do
    context '新規購入できるとき' do
      it 'すべての情報があれば購入できる' do
        expect(@order_address_form).to be_valid
      end
      it 'buildingがなくても購入できる' do
        @order_address_form.building = ''
        expect(@order_address_form).to be_valid
      end
    end
    context '新規購入できないとき' do
      it 'userが紐づいていないと購入できない' do
        @order_address_form.user_id = nil
        @order_address_form.valid?
        expect(@order_address_form.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐づいていないと購入できない' do
        @order_address_form.item_id = nil
        @order_address_form.valid?
        expect(@order_address_form.errors.full_messages).to include("Item can't be blank")
      end
      it 'postal_codeがないと購入できない' do
        @order_address_form.postal_code = ''
        @order_address_form.valid?
        expect(@order_address_form.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeは3桁-4桁の形式でないと購入できない' do
        @order_address_form.postal_code = '1234567'
        @order_address_form.valid?
        expect(@order_address_form.errors.full_messages).to include('Postal code is invalid')
      end
      it 'ara_idが1だと購入できない' do
        @order_address_form.area_id = 1
        @order_address_form.valid?
        expect(@order_address_form.errors.full_messages).to include("Area can't be blank")
      end
      it 'cityがないと購入できない' do
        @order_address_form.city = ''
        @order_address_form.valid?
        expect(@order_address_form.errors.full_messages).to include("City can't be blank")
      end
      it 'streetがないと購入できない' do
        @order_address_form.street = ''
        @order_address_form.valid?
        expect(@order_address_form.errors.full_messages).to include("Street can't be blank")
      end
      it 'phone_numberがないと購入できない' do
        @order_address_form.phone_number = ''
        @order_address_form.valid?
        expect(@order_address_form.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone numberが10桁未満の数字では購入できない' do
        @order_address_form.phone_number = '123456789'
        @order_address_form.valid?
        expect(@order_address_form.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone numberが12桁以上の数字では購入できない' do
        @order_address_form.phone_number = '012345678900'
        @order_address_form.valid?
        expect(@order_address_form.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone numberに英数字以外が含まれている場合は購入できない' do
        @order_address_form.phone_number = 'pn123456789'
        @order_address_form.valid?
        expect(@order_address_form.errors.full_messages).to include('Phone number is invalid')
      end
      it 'tokenがないと購入できない' do
        @order_address_form.token = ''
        @order_address_form.valid?
        expect(@order_address_form.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
