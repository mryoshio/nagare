class Beacon < ActiveRecord::Base
  has_many :beacon_holders
  has_many :patients, through: :beacon_holders
end
