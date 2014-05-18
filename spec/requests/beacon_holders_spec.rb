require 'spec_helper'

describe "BeaconHolders" do
  describe "GET /beacon_holders" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get beacon_holders_path
      response.status.should be(200)
    end
  end
end
