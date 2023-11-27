class UsersController < ApplicationController
  before_action :is_maching_login_user, only: [:edit, :update]
  def show
    @user = User.find(params[:id])
    @lists = @user.lists#特定のユーザに関連付けられた投稿全て@user.listsを取得できる
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end

  def is_maching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to subjects_path
    end
  end
end
