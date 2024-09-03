require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品を出品できるとき' do
      it '必要な情報があれば商品を出品できる' do
        expect(@item).to be_valid
      end
    end
    context '商品を出品できないとき' do
      it 'userが紐づいていないと出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include 'User must exist'
      end
      it 'categoryが空だと出品できない' do
        @item.category = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it 'statusが空だと出品できない' do
        @item.status = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Status can't be blank"
      end
      it 'feeが空だと出品できない' do
        @item.fee = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Fee can't be blank"
      end
      it 'statusが空だと出品できない' do
        @item.area = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Area can't be blank"
      end
      it 'dayが空だと出品できない' do
        @item.day = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Day can't be blank"
      end
      it 'imageが空だと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it 'priceが空だと出品できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is not a number'
      end
      it 'priceが300未満だと出品できない' do
        @item.price = Faker::Number.between(to: 299)
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price must be an integer'
      end
      it 'priceが9,999,999より大きいと出品できない' do
        @item.price = Faker::Number.between(from: 10_000_000)
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price must be an integer'
      end
    end
  end
end
