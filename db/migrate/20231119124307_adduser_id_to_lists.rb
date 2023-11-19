class AdduserIdToLists < ActiveRecord::Migration[6.1]
  def change
    add_column :lists, :user_id, :integer
  end
end
