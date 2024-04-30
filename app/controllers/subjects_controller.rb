class SubjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  def new
    @list = List.new#自動的にcreateアクションへのURLが送られる。List.newでモデルの情報をもとにオブジェクトが生成される。
  end

  def create　#新規投稿時、"投稿"ボタンが押下されたら実行される
    @list = List.new(list_params)#titleとbodyに絞るため（）内にストロングパラメーターを指定
    @list.user_id = current_user.id#現在のユーザを代入することで誰が投稿したかをわかるようにする。
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
    @list = List.new #部分テンプレートで新規投稿フォームを表示するために必要なインスタンス変数。indexの表示には関係ない。
  end

  def show
    @list = List.find(params[:id])#今回はレコードを1件だけ取得するので、インスタンス変数名は単数形の「@list」にします。URLのidの部分と値が同じ同じidカラムを取得
    @list2 = List.new #部分テンプレートで新規投稿フォームを表示するために必要なインスタンス変数。showの表示には関係ない。
  end

  def edit
    @list = List.find(params[:id])
  end
  def update
    list = List.find(params[:id])
    list.update(list_params)
    redirect_to subject_path(list.id)
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
