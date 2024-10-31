FactoryBot.define do
  factory :order_address do
    user_id { 1 }
    post_code { '123-4567' }
    shopping_origin_id { 2 }
    city { '神戸市' }
    street_address { '中央区1-1' }
    building_name { 'ビル名' }
    phone_number { '09012345678' }
  end
end
