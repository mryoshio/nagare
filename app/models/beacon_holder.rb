class BeaconHolder < ActiveRecord::Base
  belongs_to :beacon
  belongs_to :patient
end
