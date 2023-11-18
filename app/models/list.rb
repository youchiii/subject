class List < ApplicationRecord
  def change
    create_table :lists do |t|
      t.string :title
      t.string :body      
      t.timestamps
    end
  end
end
