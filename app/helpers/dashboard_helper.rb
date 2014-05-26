module DashboardHelper
  def beacon_holder_is_creatable?
    return true if !Beacon.count.zero? && !Patient.count.zero?
    false
  end
end
