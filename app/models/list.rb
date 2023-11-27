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

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
end
