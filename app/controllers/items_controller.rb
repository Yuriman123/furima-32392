class ItemsController < ApplicationController
  before_action :authenticate_user!,except:[:index]


  def index
  end

  def new
  @item = Item.new
  end

  def create
   @item = Item.new(item_params)
   if @item.save  # create = new + save   Item.createは、@item = Item.new(item_params) →@item.saveと同義
    redirect_to root_path
   else
    render "new"
   end
  end
  
  private
  def item_params
    params.require(:item).permit(:name,:explanation,:price,:image,:area_id,:category_id,:status_id, :delivery_burden_id,:shipping_day_id).merge(user_id: current_user.id)
  end


end
