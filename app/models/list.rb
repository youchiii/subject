class List < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
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
