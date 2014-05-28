require "spec_helper"

describe PatientsController do

  describe "routing" do
    it { expect(get: "/patients").to route_to(controller: "patients", action: "index") }
    it { expect(get: "/patients/new").to route_to(controller: "patients", action: "new") }
    it { expect(get: "/patients/1").to route_to(controller: "patients", action: "show", id: "1") }
    it { expect(get: "/patients/1/edit").to route_to(controller: "patients", action: "edit", id: "1") }
    it { expect(post: "/patients").to route_to(controller: "patients", action: "create") }
    it { expect(put: "/patients/1").to route_to(controller: "patients", action: "update", id: "1") }
    it { expect(delete: "/patients/1").to route_to(controller: "patients", action: "destroy", id: "1") }
  end

end
