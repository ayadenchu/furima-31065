FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    family_name           {Faker::Name.initials}
    first_name            {Faker::Name.initials}
    family_name_kana      {"アアア"}
    first_name_kana       {"イイイ"}
    birth_day             {"2020-01-01"}
   end
end