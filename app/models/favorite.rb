class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :list

  validates :user_id, uniqueness: {scope: :list_id}#1つの投稿に1人１回しかいいねできないようにする記述
end
