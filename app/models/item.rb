class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :buy

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :price,       format: {with: /\A[0-9]+\z/},  numericality: {
      only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  end
  
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category
    belongs_to :cost
    belongs_to :days
    belongs_to :prefectures
    belongs_to :status
    
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :status_id
      validates :cost_id
      validates :prefectures_id
      validates :days_id
    end
end
