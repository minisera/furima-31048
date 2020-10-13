require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品機能'do
    
  context '出品ができない場合'do
    it 'nameが空だと登録できない'do
      @item.name = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it 'imageが空だと登録できない'do
      @item.image = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it 'commentが空だと登録できない'do
      @item.comment = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Comment can't be blank")
    end
    it 'status_idが1だと登録できない'do
      @item.status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Status must be other than 1
        ")
    end
    it 'category_idが1だと登録できない'do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1
        ")
    end
    it 'source_idが1だと登録できない'do
      @item.source_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Source must be other than 1
        ")
    end
    it 'day_idが1だと登録できない'do
      @item.day_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Day must be other than 1
        ")
    end
    it 'charge_idが1だと登録できない'do
      @item.charge_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1
        ")
    end
    it 'priceが空だと登録できない'do
      @item.price = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it 'priceが¥299以下だと登録できない'do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Include ¥333-¥9.999.999 numbers")
    end
    it 'priceが¥10.000.000だと登録できない'do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include('Price Include ¥333-¥9.999.999 numbers')
    end
  end
  context '出品ができる場合' do
    it 'すべての情報が正しければ登録できる' do
      expect(@user).to be_valid
    end 
  end
end
end
