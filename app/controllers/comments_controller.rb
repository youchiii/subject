class CommentsController < ApplicationController
  def create
    @list = List.find(params[:subject_id])#ネストすると(params[:subject_id])でsubjectのidが取得できるようになる。
    @comment = current_user.comments.new(comment_params)
    @comment.list_id = @list.id#@commentのlist_idに@list.idを入れる
    @comment.save#ボタンが押されたら保存する
    redirect_to subject_path(@list)
  end

  def show
    @list = List.find(params[:subject_id])
    @comment = Comment.new

  end

  def destroy
    @comment = Comment.find(params[:id])
    @list = @comment.list
    @comment.destroy
    redirect_to subject_path(@list)
  end

  private

  def comment_params
    params.require(:list).permit(:comment)
  end
end
