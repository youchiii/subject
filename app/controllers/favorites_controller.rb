class FavoritesController < ApplicationController
  def create
    @list = List.find(params[:subject_id])
    @favorite = current_user.favorites.new(list_id: @list.id)
    @favorite.save!
    #redirect_to subject_path(@list)()の中がないと、どの投稿の詳細ページに遷移すればいいかわからないからエラーがでる。@listにidで指定した投稿のデータが入っているから@listを（）内に記述する
    redirect_back_or_default
  end



  def destroy
    @list = List.find(params[:subject_id])
    @favorite = current_user.favorites.find_by(list_id: @list.id)
    @favorite.destroy
    #redirect_to subject_path(@list)
    redirect_back_or_default
  end

  private

  def redirect_back_or_default
    if request.referer == subject_url(@list)
      redirect_to subject_path(@list)
    else
      redirect_to request.referer || root_path#redirect_back_or_default メソッドを導入して、直前のURLが subject_path(@list) であれば subject_path(@list) にリダイレクトし、それ以外の場合はリファラーまたはデフォルトのパスにリダイレクトするようにしています。これにより、indexアクションでいいねを押した場合はindexに、showアクションでいいねを押した場合はshowに遷移することが期待されます。
    end
  end
end
