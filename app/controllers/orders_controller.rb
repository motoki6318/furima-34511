class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]
  before_action :move_to_root_path, only: [:index, :create]

  def index
    @order_shipping = OrderShipping.new
  end

  def create
    @order_shipping = OrderShipping.new(order_shipping_params)
    if @order_shipping.valid?
      pay_item
      @order_shipping.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def order_shipping_params
    params.require(:order_shipping).permit(:post_code, :prefecture_id, :city, :address, :building_name, :tel_number)
                  .merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_root_path
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: order_shipping_params[:token],
        currency: 'jpy'
      )
  end
end
