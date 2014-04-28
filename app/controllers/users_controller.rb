class UsersController < ApplicationController

  def show
    if current_user
      @user = current_user
      @lists = List.where(:user_id => current_user.id)
      @list = List.new
      @badges = current_user.badges
    else
      redirect_to root_path
    end
  end

end
