class OrdersController < ApplicationController
  def index
    @item_order = ItemOrder.new
    @item = Item.find(params[:item_id])
  end
  
  def create
    binding.pry
    @item_order = ItemOrder.new(order_params)
    @item = Item.find(params[:item_id])
    if @item_order.valid?
      Payjp.api_key = "sk_test_eb6bacd77090fe55a69836a8"
      Payjp::Charge.create(
        amount: @item.price, 
        card: order_params[:token], 
        currency: 'jpy' 
      )
      @item_order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end
  
  private
  
  def order_params
    params.require(:item_order).permit(:postal,:city,:address,:prefecture_id,:building,:phone).merge(token: params[:token],user_id: current_user.id,item_id: params[:item_id])
  end

end
