class UsersController < ApplicationController
  before_action :is_maching_login_user, only: [:edit, :update]
  def show
    @user = User.find(params[:id])
    @lists = @user.lists#特定のユーザに関連付けられた投稿全て@user.listsを取得できる
    @lists = List.page(params[:page])
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
    user = User.find(params[:id]) #idをuserに格納
    unless user.id == current_user.id #userに格納したユーザーidが現在のユーザーと同じか比較している。
      redirect_to subjects_path #現在のユーザと一致しなかった場合、subjects_pathへリダイレクトする.例:他のユーザーのプロフィール編集画面へ遷移できなくなる
    end
  end
end
