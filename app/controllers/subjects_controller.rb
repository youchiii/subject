class SubjectsController < ApplicationController
  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    #@list.user_id = current_user.id
    @list.save
    redirect_to '/subjects'
  end

  def index
    @lists = List.all
  end

  def show
  end

  def edit
  end

  private
  # ストロングパラメータ
  def list_params
    params.require(:list).permit(:title, :body)
  end
end
