class ItemsController < ApplicationController

  def index
    @area = Area.order("created_at DESC")
    @items = Item.all
  end

  def new
  @item = Item.new
  end

  def create
   @item = Item.new(item_params)
   if @item.save  # create = new + save   Item.createは、@item = Item.new(item_params) →@item.saveと同義
    redirect_to controller: :items, action: :index
   else
    render "new"
   end
  end
  
  private
  def item_parmas
    params.require(:item).permit(:content, :image).merge(user_id: current_user.id)
  end


end
