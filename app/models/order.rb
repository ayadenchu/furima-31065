class Order
  include ActiveModel::Model
  attr_accessor :post_code, :prefectures_id, :area, :building_name, :house_number, :phone_number, :user_id, :item_id, :token


  with_options presence: true do
    validates :post_code, format: { with:/\A\d{3}[-]\d{4}\z/ }
    validates :prefectures_id, numericality: { other_than: 1 }
    validates :area
    validates :house_number
    validates :phone_number, format: { with:/\A\d{11}\z/ }
    validates :token
  end

  def save
    
    buy = Buy.create(item_id: item_id, user_id: user_id )
    Address.create(post_code: post_code, prefectures_id: prefectures_id, area: area, house_number: house_number, building_name: building_name,phone_number: phone_number ,buy_id: buy.id)
   
  end
end