class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @lists = @user.lists#特定のユーザに関連付けられた投稿全て@user.listsを取得できる
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
