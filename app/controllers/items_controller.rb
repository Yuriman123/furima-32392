class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show]

  def index
    @items = Item.includes(:user).order("created_at DESC")
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
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
  end

  
  #  参考資料 
  # def update
  #   if@prototype.update(prototype_params)
  #    redirect_to prototype_path(@prototype)
  #    else
  #      render :edit
  #    end

   


  
  private
  
  def item_params
    params.require(:item).permit(:name, :explanation, :price, :image, :area_id, :category_id, :status_id, :delivery_burden_id,
      :shipping_day_id).merge(user_id: current_user.id)
  end
end
  
