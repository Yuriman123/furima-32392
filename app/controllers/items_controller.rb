class ItemsController < ApplicationController
   before_action :set_item, only: [:edit,:update,:show]
   before_action :authenticate_user!, except: [:index, :show]
   before_action :move_to_index, only: [:edit,:update]

  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save  # create = new + save   Item.createは、@item = Item.new(item_params) →@item.saveと同義
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  # def destroy
  # end

  private

  def item_params
    params.require(:item).permit(:name, :explanation, :price, :image, :area_id, :category_id, :status_id, :delivery_burden_id,
                                 :shipping_day_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end


  def move_to_index 
    if current_user.id != @item.user.id 
      redirect_to root_path
     end
  end

end
