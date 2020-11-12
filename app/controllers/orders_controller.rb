class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order = Order.new
  end

  def cteate
    @order = Order.new(order_params)
  end


  private
  def order_params
    params.require(:order).permit(:post_code, :prefecture, :area, :building_name, :house_number, :phone_number).marge(user_id: current_user.id, item_id: item.id)
  end
end
