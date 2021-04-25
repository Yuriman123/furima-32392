class OrdersController < ApplicationController
  before_action :set_item, only: [:index,:create]


def index
  @item= Item.find(params[:item_id])
end

def new
  user_order =UserOrder.new
end

def create
  @user_order = UserOrder.new(address_parms)

  if @user_order.valid?  # create = new + save   Item.createは、@item = Item.new(item_params) →@item.saveと同義
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
  def address_parms
    # params.permit(:postno,:area_id,:address,:street,:tell, :building).merge(user_id: current_user.id, item_id: current_user.item_id)
  end


  def set_item
    @item = Item.find(params[:item_id])
  end