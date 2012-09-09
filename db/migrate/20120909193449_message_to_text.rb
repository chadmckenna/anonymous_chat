class MessageToText < ActiveRecord::Migration
  def up
    change_column :messages, :message, :text, :limit => nil
  end

  def down
    change_column :messages, :message, :string
  end
end
