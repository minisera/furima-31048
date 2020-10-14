FactoryBot.define do
  factory :item do
    name { Faker::Name.name }
    comment { Faker::Lorem.sentence }
    price { 3000 }
    status_id { 2 }
    category_id { 2 }
    charge_id { 2 }
    source_id { 2 }
    day_id { 2 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
