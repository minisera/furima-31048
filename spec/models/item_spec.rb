require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品機能'do
    
  context '出品ができない場合'do
    it 'nameが空だと登録できない'do
      @item.name = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("")
    end
    it 'nameが空だと登録できない'do
      @item.name = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("")
    end
    it 'nameが空だと登録できない'do
      @item.name = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("")
    end
    it 'nameが空だと登録できない'do
      @item.name = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("")
    end
    it 'nameが空だと登録できない'do
      @item.name = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("")
    end
    it 'nameが空だと登録できない'do
      @item.name = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("")
    end
  end
end
end
