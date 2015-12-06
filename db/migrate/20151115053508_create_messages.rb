class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :sender_id
      t.text :body

      t.timestamps null: false
    end
    add_foreign_key :messages, :user, name: :sender_id

    create_table :messages_users, :id=>false do |t|
      t.column :user_id, :integer
      t.column :message_id, :integer
    end

    create_table :groups_messages, :id=>false do |t|
      t.column :group_id, :integer
      t.column :message_id, :integer
    end
  end
end
