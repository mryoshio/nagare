require "spec_helper"

describe BeaconHoldersController do

  describe "routing" do
    it { expect(get: "/beacon_holders").to route_to(controller: "beacon_holders", action: "index") }
    it { expect(get: "/beacon_holders/new").to route_to(controller: "beacon_holders", action: "new") }
    it { expect(get: "/beacon_holders/1").to route_to(controller: "beacon_holders", action: "show", id: "1") }
    it { expect(get: "/beacon_holders/1/edit").to route_to(controller: "beacon_holders", action: "edit", id: "1") }
    it { expect(post: "/beacon_holders").to route_to(controller: "beacon_holders", action: "create") }
    it { expect(put: "/beacon_holders/1").to route_to(controller: "beacon_holders", action: "update", id: "1") }
    it { expect(delete: "/beacon_holders/1").to route_to(controller: "beacon_holders", action: "destroy", id: "1") }
  end

end
