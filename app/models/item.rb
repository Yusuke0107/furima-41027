class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shopping_cost
  belongs_to :shopping_days
  belongs_to :shopping_origin

  validates :category, :condition, :shopping_cost,:shopping_days, :shopping_origin, presence: true

  validates :category_id,:condition_id, :shopping_cost_id,:shopping_days_id, :shopping_origin_id, numericality: { other_than: 1 , message: "can't be blank"}
end