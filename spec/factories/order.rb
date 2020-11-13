FactoryBot.define do
  factory :order do
    token {"tok_abcdefghijk00000000000000000"}
    post_code { "123-4567" }
    prefectures_id { 2 }
    area { "横浜市緑区" }
    house_number { "青山1-1-1" }
    building_name { "phone_numbe" }
    phone_number { "09011111111"}
  end
end