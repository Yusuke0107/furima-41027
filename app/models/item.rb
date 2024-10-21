class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  belongs_to :category, class_name: 'Category', foreign_key: 'category_id', optional: true
  belongs_to :condition, class_name: 'Condition', foreign_key: 'condition_id', optional: true
  belongs_to :shopping_cost, class_name: 'ShoppingCost', foreign_key: 'shopping_cost_id', optional: true
  belongs_to :shopping_day, class_name: 'ShoppingDay', foreign_key: 'shopping_day_id', optional: true
  belongs_to :shopping_origin, class_name: 'ShoppingOrigin', foreign_key: 'shopping_origin_id', optional: true

  validates :image,              presence: { message: "can't be blank" }
  validates :item_name,          presence: { message: "can't be blank" }
  validates :description,        presence: { message: "can't be blank" }
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :condition_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :shopping_cost_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :shopping_origin_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :shopping_day_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :price, presence: { message: "can't be blank" }
  validates :price, numericality: { greater_than_or_equal_to: 300, message: 'must be greater than or equal to 300' }
  validates :price, numericality: { less_than_or_equal_to: 9999999, message: 'must be less than or equal to 9999999' }
  validates :price, numericality: { only_integer: true, message: 'must be an integer' }
end