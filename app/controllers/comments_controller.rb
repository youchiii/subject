class CommentsController < ApplicationController
  def create
    @list = List.find(params[:id])
    @comment = current_user.comments.new(comment_params)
    @comment.list_id = list_id
    @comment.save
    redirect_to comment_path
  end

  def show
    @list = List.find(params[:id])
    @comment = Comment.new

  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
