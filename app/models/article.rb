class Article < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shopping_cost
  belongs_to :shopping_origin
  belongs_to :shopping_day

  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :condition_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :shopping_cost_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :shopping_origin_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :shopping_day_id, numericality: { other_than: 1, message: "can't be blank" }
end
