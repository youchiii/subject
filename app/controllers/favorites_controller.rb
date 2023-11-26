class FavoritesController < ApplicationController
  def create
    @list = List.find(params[:subject_id])
    @favorite = current_user.favorites.new(list_id: @list.id)
    @favorite.save!
    redirect_to subject_path(@list)#()の中がないと、どの投稿の詳細ページに遷移すればいいかわからないからエラーがでる。@listにidで指定した投稿のデータが入っているから@listを（）ないに記述する
  end

  def destroy
    @list = List.find(params[:subject_id])
    @favorite = current_user.favorites.find_by(list_id: @list.id)
    @favorite.destroy
    redirect_to subject_path(@list)
  end
end
