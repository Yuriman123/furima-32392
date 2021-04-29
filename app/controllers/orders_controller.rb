class OrdersController < ApplicationController
  before_action :set_item, only: [:index,:create]
  before_action :redirect_user, only: [:index]
  before_action :authenticate_user!


def index

  @user_order = UserOrder.new
end


def create
  @user_order = UserOrder.new(address_parms)
   if @user_order.valid?  # create = new + save   Item.createは、@item = Item.new(item_params) →@item.saveと同義
    pay_item   
    @user_order.save

    redirect_to root_path    
  else
    render :index
  end
end




end

private
  def set_item
    @item = Item.find(params[:item_id])
  end

  def address_parms
    params.require(:user_order).permit(:postno,:area_id,:address,:street,:tell, :building).merge(user_id: current_user.id,item_id: params[:item_id],token: params[:token] )
  end


  def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: address_parms[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end


  def redirect_user
    if current_user.id == @item.user.id  or @item.order != nil
      redirect_to root_path
     end
  end

