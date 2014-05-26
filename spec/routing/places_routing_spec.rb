require "spec_helper"

describe PlacesController do

  describe "routing" do
    it { expect(get: "/places").to route_to(controller: "places", action: "index") }
    it { expect(get: "/places/new").to route_to(controller: "places", action: "new") }
    it { expect(get: "/places/1").to route_to(controller: "places", action: "show", id: "1") }
    it { expect(get: "/places/1/edit").to route_to(controller: "places", action: "edit", id: "1") }
    it { expect(post: "/places").to route_to(controller: "places", action: "create") }
    it { expect(put: "/places/1").to route_to(controller: "places", action: "update", id: "1") }
    it { expect(delete: "/places/1").to route_to(controller: "places", action: "destroy", id: "1") }
  end

end
