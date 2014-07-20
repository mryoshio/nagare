class Patient < ActiveRecord::Base
  has_many :beacon_holders
  has_many :beacons, through: :beacon_holders
end
