class SubjectsController < ApplicationController
  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.user_id = current_user.id
    @list.save!　#びっくりマーク付けると保存できない原因がエラー文でわかる
    @lists = List.all
    render :index
  end

  def index
    @lists = List.all #lists複数形は配列的な感じ
  end

  def show
    @list = List.find(params[:id])
  end

  def edit
  end

  private
  # ストロングパラメータ
  def list_params
    params.require(:list).permit(:title, :body)
  end
end
