class Place < ActiveRecord::Base
  has_many :stations
  has_many :receivers, through: :stations
end
