class AddUserIdColumn < ActiveRecord::Migration
  def change
    add_column :moments, :user_id, :integer
  end
end
