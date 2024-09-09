require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.build(:order)
  end

  describe '商品購入機能' do
    context '新規購入できるとき' do
      it 'すべての情報があれば購入できる' do
        expect(@order).to be_valid
      end
    end
    context '新規購入できないとき' do
      it 'userが紐づいていないと購入できない' do
        @order.user = nil
        @order.valid?
        expect(@order.errors.full_messages).to include 'User must exist'
      end
      it 'itemが紐づいていないと購入できない' do
        @order.item = nil
        @order.valid?
        expect(@order.errors.full_messages).to include 'User must exist'
      end
    end
  end
end
