class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index]
  before_action :ensure_item_owner, only: [:index]

  def index
    @order_address = OrderAddress.new
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
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
    params.require(:order_address).permit(:post_code, :shopping_origin_id, :city, :street_address, :building_name, :phone_number, :item_id)
    .merge(user_id: current_user.id, token: params[:token])
  end

  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount:  @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def ensure_item_owner
    if @item.sold_out? || @item.user_id == current_user.id
      redirect_to root_path
    end
  end
end
