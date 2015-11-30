class AddDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :FirstName, :string
    add_column :users, :LastName, :string
    add_column :users, :Phone, :string
    add_column :users, :DateOfBirth, :Date
  end
end
