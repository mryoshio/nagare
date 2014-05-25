require "spec_helper"

describe BeaconHoldersController do
  describe "routing" do

    it "routes to #index" do
      get("/beacon_holders").should route_to("beacon_holders#index")
    end

    it "routes to #new" do
      get("/beacon_holders/new").should route_to("beacon_holders#new")
    end

    it "routes to #show" do
      get("/beacon_holders/1").should route_to("beacon_holders#show", :id => "1")
    end

    it "routes to #edit" do
      get("/beacon_holders/1/edit").should route_to("beacon_holders#edit", :id => "1")
    end

    it "routes to #create" do
      post("/beacon_holders").should route_to("beacon_holders#create")
    end

    it "routes to #update" do
      put("/beacon_holders/1").should route_to("beacon_holders#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/beacon_holders/1").should route_to("beacon_holders#destroy", :id => "1")
    end

  end
end
