class UserStringToMessages < ActiveRecord::Migration
  def self.up
    add_column :messages, :user_string, :string
  end

  def self.down
    remove_column :messages, :user_string
  end
end
