require "spec_helper"

describe ReceiversController do

  describe "routing" do
    it { expect(get: "/receivers").to route_to(controller: "receivers", action: "index") }
    it { expect(get: "/receivers/new").to route_to(controller: "receivers", action: "new") }
    it { expect(get: "/receivers/1").to route_to(controller: "receivers", action: "show", id: "1") }
    it { expect(get: "/receivers/1/edit").to route_to(controller: "receivers", action: "edit", id: "1") }
    it { expect(post: "/receivers").to route_to(controller: "receivers", action: "create") }
    it { expect(put: "/receivers/1").to route_to(controller: "receivers", action: "update", id: "1") }
    it { expect(delete: "/receivers/1").to route_to(controller: "receivers", action: "destroy", id: "1") }
  end

end
