class ItemsController < ApplicationController

  def index
    #@items = Item.visible_to(current_user)
  end

  def new
    @item = Item.new
  end

  def create
    @user = User.find(params[:id])
    @item = @user.items.new(item_params)
    @item.user = current_user
    #@new_item = Item.new

    if @item.save
      flash[:notice] = "Item saved successfully."
      redirect_to @item
    else
      flash[:alert] = "Item failed to save."
      render :new
    end
  end

  def show
    #@item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:body)
  end
end
