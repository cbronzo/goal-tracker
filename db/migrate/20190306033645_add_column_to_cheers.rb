class AddColumnToCheers < ActiveRecord::Migration[5.2]
  def change
    add_column :cheers, :user_id, :integer
    add_column :cheers, :post_id, :integer
  end
end
