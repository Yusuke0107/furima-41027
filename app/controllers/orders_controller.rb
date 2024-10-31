class OrdersController < ApplicationController
  attr_accessor :token
  before_action :authenticate_user!
  before_action :set_item, only: [:index]
  before_action :ensure_item_owner, only: [:index]

  def index
    @order_address = OrderAddress.new
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
  end

  def new
    @order_address = OrderAddress.new
  end

  def create
    @item = Item.find(params[:order_address][:item_id])
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      @item.update(sold_out: true)
      return redirect_to root_path
    else
        render :index, status: :unprocessable_entity
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:order_address).permit(:item_id, :user_id, :post_code, :shopping_origin_id, :city, :street_address, :building_name, :phone_number).merge(user_id: current_user.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = "sk_test_001a071d70b31c86c62facd8"
    Payjp::Charge.create(
      amount:  @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def ensure_item_owner
    if @item.sold_out || @item.user_id == current_user.id
      redirect_to root_path
    end
  end
end
