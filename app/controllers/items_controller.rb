class ItemsController < ApplicationController

  def index
    @items = Item.all
    #@items = Item.visible_to(current_user)
  end

  def new
    @item = Item.new
  end

  def create
    @user = User.find(params[:user_id])
    @item = @user.items.new(item_params)
    @item.user = current_user
    #@new_item = Item.new

    if @item.save
      flash[:notice] = "Item saved successfully."
      redirect_to [@user]
    else
      flash[:alert] = "Item failed to save."
      redirect_to [@user]
    end
  end

  def show
    @item = Item.find(params[:user_id])
  end

  private

  def item_params
    params.require(:item).permit(:name)
  end
end
