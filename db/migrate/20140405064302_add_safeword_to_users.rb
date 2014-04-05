class AddSafewordToUsers < ActiveRecord::Migration
  def up
    add_column :users, :safeword, :string
    add_column :users, :duresscode, :string

    User.all.each do |user|
      if user.message == nil
        user.message = 'This is ' + user.name + '. If you get this message, I did not get home safely when planned, and I might be in danger. (Do not reply to this message.)'
        user.save
      end
    end
    change_column :users, :message, :text, :null => false
  end

  def down
    remove_column :users, :duresscode
    remove_column :users, :safeword
  end
end
