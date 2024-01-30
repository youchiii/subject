class SubjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  def new
    @list = List.new#自動的にcreateアクションへのURLが送られる。List.newでモデルの情報をもとにオブジェクトが生成される。
  end

  def create
    @list = List.new(list_params)
    @list.user_id = current_user.id
    if @list.save#びっくりマーク付けると保存できない原因がエラー文でわかる
      @ists = List.all
      redirect_to action: :index #renderでindexに遷移すると@lists = List.allのままなのでページネーションでエラーが起きる
    else
      @lists = List.all
    render :new
    end
  end

  def index
    #@lists = List.all ・・・lists複数形は配列的な感じ
    @lists = List.page(params[:page])
    @list = List.new #部分テンプレートで新規投稿フォームを表示するために必要なインスタンス変数。indexの表示には関係ない。
  end

  def show
    @list = List.find(params[:id])
    @list2 = List.new #部分テンプレートで新規投稿フォームを表示するために必要なインスタンス変数。showの表示には関係ない。
  end

  def edit
  end

  def destroy
    @list = List.find(params[:id])  # データ（レコード）を1件取得
    @list.destroy  # データ（レコード）を削除
    redirect_to '/subjects'
  end

  def top
    @lists = List.all
  end

  private#ストロングパラメータ:境界線privateの中に書いたものは書かれたコントローラー(この場合はsubjects_controller)でしか呼び出せない。「モデル名_params」とすることが多い.
  def list_params
    params.require(:list).permit(:title, :body) #formから送られてくるデータはparamsの中に入ってる。listモデルの中のtitleカラムとbodyカラムのみ保存を許可する
  end
end
