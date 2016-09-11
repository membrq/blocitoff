class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    #@items = @user.items.visible_to(current_user)
  end
end
