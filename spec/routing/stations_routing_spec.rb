require "spec_helper"

describe StationsController do

  describe "routing" do
    it { expect(get: "/stations").to route_to(controller: "stations", action: "index") }
    it { expect(get: "/stations/new").to route_to(controller: "stations", action: "new") }
    it { expect(get: "/stations/1").to route_to(controller: "stations", action: "show", id: "1") }
    it { expect(get: "/stations/1/edit").to route_to(controller: "stations", action: "edit", id: "1") }
    it { expect(post: "/stations").to route_to(controller: "stations", action: "create") }
    it { expect(put: "/stations/1").to route_to(controller: "stations", action: "update", id: "1") }
    it { expect(delete: "/stations/1").to route_to(controller: "stations", action: "destroy", id: "1") }
  end

end
