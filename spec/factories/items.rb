FactoryBot.define do
  factory :item do
    association :user

    name { 'a' }
    description { 'aa' }
    category_id { 2 }
    state_id { 2 }
    burden_id { 2 }
    area_id { 2 }
    scheduled_date_id { 2 }
    price { 300 }
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
