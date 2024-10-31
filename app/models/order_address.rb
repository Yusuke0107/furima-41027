class OrderAddress
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :post_code, :shopping_origin_id, :city, :street_address, :building_name, :phone_number, :token

  validates :item_id, presence: { message: "can't be blank" }
  validates :user_id, presence: { message: "can't be blank" }
  validates :city, presence: { message: "can't be blank" }
  validates :street_address, presence: { message: "can't be blank" }
  validates :phone_number, presence: { message: "can't be blank" }, format: { with: /\A\d{10,11}\z/, message: "must be 10 or 11 digits" }
  validates :post_code, presence: { message: "can't be blank" }, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
  validates :shopping_origin_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :token, presence:true

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(post_code: post_code, shopping_origin_id: shopping_origin_id, city: city, street_address: street_address, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end