class RemoveCheerFromPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :cheer, :integer
  end
end
