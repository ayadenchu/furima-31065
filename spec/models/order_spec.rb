require 'rails_helper'

RSpec.describe Order, type: :model do
  describe '#create' do
    before do
      @order = FactoryBot.build(:order)
    end
    
    it '全ての項目が埋まっていれば保存できる' do
      expect(@order).to be_valid
    end
    
    it 'building_nameは空でも保存できる' do
      @order.building_name = nil
      expect(@order).to be_valid
    end
    
    it "tokenが空では保存できない" do
      @order.token = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Token can't be blank")
    end

    it 'post_codeが空では保存できない' do
      @order.post_code = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Post code can't be blank")
    end

    it 'post_codeはハイフンがないと保存できない' do
      @order.post_code = "1234567"
      @order.valid?
      expect(@order.errors.full_messages).to include("Post code is invalid")
    end
    
    it 'prefectures_idは選択してないと保存できない' do
      @order.prefectures_id = 1
      @order.valid?
      expect(@order.errors.full_messages).to include("Prefectures must be other than 1")
    end
    
    it 'areaが空だと保存できない' do
      @order.area = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Area can't be blank")
    end
    
    it 'house_numberが空だと保存できない' do
      @order.house_number = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("House number can't be blank")
    end

    it 'phone_numberが空だと保存できない' do
      @order.phone_number = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Phone number can't be blank")
    end

    it 'phone_numberはハイフンは不要である事' do
      @order.phone_number = "090-1111-1111"
      @order.valid?
      expect(@order.errors.full_messages).to include("Phone number is invalid")
    end
    
    it 'phone_numberは11桁以内である事' do
      @order.phone_number = "090123456789"
      @order.valid?
      expect(@order.errors.full_messages).to include("Phone number is invalid")
    end

    it 'phone_numberは半角数字出ないと保存できない'do
    @order.phone_number = "０９０１１１１１１１１"
    @order.valid?
    expect(@order.errors.full_messages).to include("Phone number is invalid")
    end

  end
end