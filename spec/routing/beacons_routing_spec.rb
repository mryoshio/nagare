require "spec_helper"

describe BeaconsController do

  describe "routing" do
    it { expect(get: "/beacons").to route_to(controller: "beacons", action: "index") }
    it { expect(get: "/beacons/new").to route_to(controller: "beacons", action: "new") }
    it { expect(get: "/beacons/1").to route_to(controller: "beacons", action: "show", id: "1") }
    it { expect(get: "/beacons/1/edit").to route_to(controller: "beacons", action: "edit", id: "1") }
    it { expect(post: "/beacons").to route_to(controller: "beacons", action: "create") }
    it { expect(put: "/beacons/1").to route_to(controller: "beacons", action: "update", id: "1") }
    it { expect(delete: "/beacons/1").to route_to(controller: "beacons", action: "destroy", id: "1") }
  end

end
