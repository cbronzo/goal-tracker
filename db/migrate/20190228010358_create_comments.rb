class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :comment_text
      t.date :date_created

      t.timestamps
    end
  end
end
