class SubjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.user_id = current_user.id
    if @list.save#びっくりマーク付けると保存できない原因がエラー文でわかる
    @lists = List.all
    redirect_to action: :index #renderでindexに遷移すると@lists = List.allのままなのでページネーションでエラーが起きる
    else
    @lists = List.all
    render :new
    end
  end

  def index
    #@lists = List.all ・・・lists複数形は配列的な感じ
    @lists = List.page(params[:page])
  end

  def show
    @list = List.find(params[:id])
  end

  def edit
  end

  def destroy
    @list = List.find(params[:id])  # データ（レコード）を1件取得
    @list.destroy  # データ（レコード）を削除
    redirect_to '/subjects'
  end

  def top

  end
  private
  # ストロングパラメータ
  def list_params
    params.require(:list).permit(:title, :body)
  end
end
