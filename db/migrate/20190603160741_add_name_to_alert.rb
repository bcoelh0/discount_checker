class AddNameToAlert < ActiveRecord::Migration[5.2]
  def change
    add_column :alerts, :name, :string
  end
end
