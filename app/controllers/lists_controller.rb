class ListsController < ApplicationController



  def new
    @user = current_user
    @list = List.new

  end

  def create
    @user = current_user
    @list = List.create(title: params[:list][:title], user_id: @user.id)
    redirect_to edit_list_path(@list)
  end

  def edit
    @list = List.find(params[:id])
    respond_to do |format|
      format.js { render js  }
    end
  end


  private
  def list_params
    params.require(:list).permit(:title)
  end

end
