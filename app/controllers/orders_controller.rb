class OrdersController < ApplicationController
  before_action :set_item, only: [:index,:create]


def index
  binding.pry
  @user_order = UserOrder.new
  @item= Item.find(params[:item_id])
end


def create
  @user_order = UserOrder.new(address_parms)
   if @user_order.valid?  # create = new + save   Item.createは、@item = Item.new(item_params) →@item.saveと同義
    # pay_item   
    @user_order.save

    redirect_to root_path    
  else
    render :index
  end
end


# @user_donation = UserDonation.new(donation_params)
# if user_donation.valid?
#    @user_donation.save
#    redirect_to action: :index
# else
#   render avtion: :new
# end


end

private
  def set_item
    @item = Item.find(params[:item_id])
  end

  def address_parms
    params.require(:user_order).permit(:postno,:area_id,:address,:street,:tell, :building).merge(user_id: current_user.id,item_id: params[:item_id] )
  end

  def order_params
    params.require(:order).permit(:price).merge(token: params[:token])
  end

  # def pay_item
  #   Payjp.api_key = sk_test_2668ddad309716b337b15658    # 自身のPAY.JPテスト秘密鍵を記述しましょう
  #   Payjp::Charge.create(
  #     amount: order_params[:price],  # 商品の値段
  #     card: order_params[:token],    # カードトークン
  #     currency: 'jpy'                 # 通貨の種類（日本円）
  #   )
  # end
