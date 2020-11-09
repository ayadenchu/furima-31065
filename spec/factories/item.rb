FactoryBot.define do
  factory :item do
    association :user
    name {Faker::Name.name}
    description {Faker::Lorem.sentence}
    category_id	{2}
    status_id {2}
    cost_id {2}
    prefectures_id {2}
    days_id {2}
    price {1000}

    after(:build) do |item|
      item.image.attach(io: File.open('public/test_image.png'), filename: 'test_image.png')
    end
  end
end