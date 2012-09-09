class Room < ActiveRecord::Base
  has_many :messages
  attr_accessible :hash
end
