FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    last_name { 'コウスケ' }
    first_name { 'アマノ' }
    last_name_kana { 'コウスケ' }
    first_name_kana { 'アマノ' }
    date_of_birth { '1930-01-02' }
  end
end
