require "spec_helper"

describe DashboardController do

  describe "routing" do
    it { expect(get: "/").to route_to(controller: "dashboard", action: "index") }
  end

end
