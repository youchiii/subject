class AddListIdToComments < ActiveRecord::Migration[6.1]
  def change
    add_column :comments, :list_id, :integer
  end
end
