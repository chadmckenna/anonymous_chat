class RoomStringToRooms < ActiveRecord::Migration
  def up
    add_column :rooms, :room_string, :string
  end

  def down
    remove_column :rooms, :room_string
  end
end
