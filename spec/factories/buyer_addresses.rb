FactoryBot.define do
  factory :buyer_address do
    token { 'sumpletoken' }
    postal_code { '123-4567' }
    area_id { 2 }
    municipality { '渋谷区' }
    address { '1-1' }
    building { '東京ハイツ' }
    phone_number { '08080008000' }
  end
end
