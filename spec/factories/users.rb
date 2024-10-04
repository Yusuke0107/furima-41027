FactoryBot.define do
  factory :user do
    nickname              { Faker::Internet.username }
    email                 { Faker::Internet.email }
    password              { "1a" + Faker::Internet.password(min_length: 6)}
    password_confirmation { password }
    first_name            { 'ああああ' }
    last_name             { 'いいいい' }
    first_name_kana       { 'アアアア' }
    last_name_kana        { 'イイイイ' }
    birth_date            { Faker::Date.birthday }
  end
end