FactoryBot.define do
  factory :item do
    item_name { "Sample Item" }
    description { "This is a sample item." }
    category_id { 1 }
    condition_id { 1 }
    shopping_cost_id { 1 }
    shopping_origin_id { 1 }
    shopping_day_id { 1 }
    price { 300 }
    
    association :user
  end
end
