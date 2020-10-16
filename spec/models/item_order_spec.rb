require 'rails_helper'

RSpec.describe ItemOrder, type: :model do
  describe '商品購入機能' do
    before do
      @item_order = FactoryBot.build(:item_order)
    end

    context '購入できない場合' do
      it 'tokenが空の場合' do
        @item_order.token = ''
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Token can't be blank")
      end
      it 'postalが空の場合' do
        @item_order.postal = ''
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Postal can't be blank")
      end
      it 'postalは全角があり、ハイフンがない場合は登録できない' do
        @item_order.postal = '１１１１１１１１'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('Postal Include both hyphen and numbers')
      end
      it 'cityが空の場合' do
        @item_order.city = ''
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空の場合' do
        @item_order.address = ''
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Address can't be blank")
      end
      it 'phoneが空の場合' do
        @item_order.phone = ''
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Phone can't be blank")
      end
      it 'phoneはハイフンや全角があると保存できない' do
        @item_order.phone = '１１１-1111111'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('Phone Include only numbers')
      end
      it 'prefecture_idが１だと登録できない' do
        @item_order.prefecture_id = 1
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it 'prefecture_idが空の場合' do
        @item_order.prefecture_id = ''
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Prefecture can't be blank")
      end
    end
    context '購入できる場合' do
      it 'buildingは空でも登録できること' do
        @item_order.building = ''
        expect(@item_order).to be_valid
      end
      it '全ての情報が正しい場合登録できること' do
        expect(@item_order).to be_valid
      end
    end
  end
end
