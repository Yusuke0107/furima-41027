class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user

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