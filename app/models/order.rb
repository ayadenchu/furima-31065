class Order
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture, :area, :building_name, :house_number, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :post_code
    validates :prefecture
    validates :area
    validates :house_number
    validates :phone_number
  end

  def save
    # 住所の情報を保存
    Address.create(postal_code: postal_code, prefecture: prefecture, city: city, house_number: house_number, building_name: building_name)
    # Buyの情報を保存
    Buy.create(item_id: item.id, user_id: user_id )
  end
end