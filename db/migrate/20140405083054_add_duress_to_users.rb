class AddDuressToUsers < ActiveRecord::Migration
  def up
    add_column :users, :duress, :boolean
    remove_column :users, :responded
    remove_column :users, :alerted
  end

  def down
    add_column :users, :alerted, :boolean
    add_column :users, :responded, :boolean
    remove_column :users, :duress
  end
end
