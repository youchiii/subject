class List < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  validates :title, presence: true #エラーメッセージを表示するためのバリデーション
  validates :body, presence: true #エラーメッセージを表示するためのバリデーション
  def change
    create_table :lists do |t|
      t.string :title
      t.string :body
      t.timestamps
    end
  end

  #スコープ定義
  scope :latest, -> {order(created_at: :desc)}
  scope :old, -> {order(created_at: :asc)}
  scope :star_count, -> {order(star: :desc)}
  #コメント数でソート
  scope :comment_count, -> {
    left_joins(:comments)
      .group(:id)
      .order('COUNT(comments.id) DESC')
  }
  #いいね数でソート
  scope :favorite_count, -> {
    left_joins(:favorites)
      .group(:id)
      .order('COUNT(favorites.id) DESC')
  }



  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
end


