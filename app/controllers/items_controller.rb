class ItemsController < ApplicationController

  def index
    @area = Area.order("created_at DESC")
  end

  def new
   @item = Item.new(item_parmas)
   if @item.save
    redirect_to controller: :items, action: :index
   else
    render "new"
   end
  end
  
  private
  def item_parmas
    prams.require(:item).permit(:content, :image).merge(user_id: current_user.id)
  end


end
