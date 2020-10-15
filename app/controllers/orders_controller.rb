class OrdersController < ApplicationController
  def index
    @order_item = OrderItem.new
  end

  def create
    @order_item = OrderItem.new(order_params)
    if @order_item.valid?
      Payjp.api_key = "sk_test_eb6bacd77090fe55a69836a8"
      Payjp::Charge.create(
        amount: @order.item.price, 
        card: order_params[:token], 
        currency: 'jpy' 
      )
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end
 
  private

  def order_params
    params.require(:order_item).permit(:postal,:city,:address,:prefecture_id,:building,:phone).merge(token: params[:token])
  end

end
