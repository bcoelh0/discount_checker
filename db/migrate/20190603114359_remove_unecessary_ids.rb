class RemoveUnecessaryIds < ActiveRecord::Migration[5.2]
  def change
    remove_column :alerts, :user_id
    remove_column :alerts, :product_id
  end
end
