class Receiver < ActiveRecord::Base
  has_many :stations
  has_many :places, through: :stations
end
