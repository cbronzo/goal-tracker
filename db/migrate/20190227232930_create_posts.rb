class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.references :user
      t.string :title
      t.string :description
      t.date :due_date

      t.timestamps
    end
  end
end
