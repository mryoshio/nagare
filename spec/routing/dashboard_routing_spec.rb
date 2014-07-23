require "spec_helper"

describe DashboardController do

  describe "routing" do
    it { expect(get: "/dashboard/index").to route_to(controller: "dashboard", action: "index") }
  end

end
