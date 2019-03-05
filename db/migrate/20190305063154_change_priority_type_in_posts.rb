class ChangePriorityTypeInPosts < ActiveRecord::Migration[5.2]
  def change
     change_column :posts, :priority, :integer
  end
end
