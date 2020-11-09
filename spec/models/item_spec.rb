require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end 

    it '全ての項目が埋まっていれば保存できる' do
      expect(@item).to be_valid
    end

    it '商品画像を1枚つけることが必須であること' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it 'nameが空だと保存できないこと' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it 'descriptionが空だと保存できないこと' do
      @item.description = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end

    it 'category_idが空だと保存できないこと' do
      @item.category_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
    end
    
    it 'status_idが空だと保存できないこと' do
      @item.status_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Status must be other than 1")
    end
    
    it 'cost_idが空だと保存できないこと' do
      @item.cost_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Cost must be other than 1")
    end
    
    it 'prefectures_idが空だと保存できないこと' do
      @item.prefectures_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefectures must be other than 1")
    end

    it 'days_idが空だと保存できないこと' do
      @item.days_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Days must be other than 1")
    end
    
    it 'priceが空だと保存できないこと' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    
    it 'priceは300以下だと保存できないこと' do
      @item.price = "100"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
    end
    
    it 'priceは9999999以上だと保存できないこと' do
      @item.price = "10000000"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
    end

    it 'priceは半角数字のみ保存可能であること' do
      @item.price = "１０００"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end
  end
end