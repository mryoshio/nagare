class BeaconHolder < ActiveRecord::Base
  belongs_to :beacon
  belongs_to :patient

  def self.creatable?
    !(::Beacon.count.zero? || ::Patient.count.zero?)
  end
end
