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
    @new_item = Item.new

    if @item.save
      flash[:notice] = "Item saved successfully."
    else
      flash[:alert] = "Item failed to save."
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @item = Item.find(params[:user_id])
  end

  def destroy
    @user = User.find(params[:user_id])
    @item = @user.items.find(item_params)

    if @item.destroy
      flash[:notice] = "Item was deleted."
      #redirect_to [@user]
    else
      flash[:alert] = "Item couldn't be deleted. Try again!"
      #redirect_to [@user]
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  def item_params
    params.require(:item).permit(:name)
  end
end
