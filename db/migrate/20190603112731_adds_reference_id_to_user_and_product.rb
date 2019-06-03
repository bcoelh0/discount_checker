class AddsReferenceIdToUserAndProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :alert_id, :integer
    add_column :users, :alert_id, :integer
  end
end
