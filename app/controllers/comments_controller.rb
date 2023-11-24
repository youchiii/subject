class CommentsController < ApplicationController
  def create
    @list = List.find(params[:subject_id])
    @comment = current_user.comments.new(comment_params)
    @comment.list_id = @list.id
    @comment.save
    redirect_to subject_path(@list)
  end

  def show
    @list = List.find(params[:subject_id])
    @comment = Comment.new

  end

  def destroy
    @list = List.find(params[:id])
    @comment = @list.comment.find(params[:id])
    @comment.destroy
    redirect_to subject_path(@list)
  end

  private

  def comment_params
    params.require(:list).permit(:comment)
  end
end
