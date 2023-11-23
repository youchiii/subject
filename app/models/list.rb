class List < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  def change
    create_table :lists do |t|
      t.string :title
      t.string :body
      t.timestamps
    end
  end
end
