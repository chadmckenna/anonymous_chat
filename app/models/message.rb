class Message < ActiveRecord::Base
  belongs_to :room
  attr_accessible :message, :room_id
end
