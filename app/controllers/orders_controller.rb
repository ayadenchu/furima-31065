class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  def index
    if @item.user.id == current_user.id
      redirect_to root_path
    else
      if @item.buy.nil? 
        @order = Order.new
      else
        redirect_to root_path
      end
    end
  end

  def create
    @order = Order.new(order_params)
      if @order.valid?
        pay_item
        @order.save
        return redirect_to root_path
      else
        render 'index'
      end
  end


  private
  def order_params
    params.require(:order).permit(:post_code, :prefectures_id, :area, :building_name, :house_number, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id],token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: Item.find(params[:item_id]).price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
