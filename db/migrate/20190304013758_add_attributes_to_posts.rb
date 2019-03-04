class AddAttributesToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :ongoing, :boolean
    add_column :posts, :difficulty, :integer
    add_column :posts, :category, :string
    add_column :posts, :priority, :string
    add_column :posts, :progress, :integer
    add_column :posts, :question, :string
  end
end
