class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user.id == @item.user.id || @item.order
    @item_order = ItemOrder.new
  end

  def create
    @item_order = ItemOrder.new(order_params)
    @item = Item.find(params[:item_id])
    if @item_order.valid?
      pay_item
      @item_order.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.require(:item_order).permit(:postal, :city, :address, :prefecture_id, :building, :phone).merge(token: params[:token], user_id: current_user.id, item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
