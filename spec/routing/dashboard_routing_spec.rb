require "spec_helper"

describe DashboardController do
  describe "routing" do
    it "routes to root" do
      get("/").should route_to("dashboard#index")
    end
  end
end
