class FixRelationshipIds < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :alert_id
    add_column :alerts, :user_id, :integer
  end
end
