require 'spec_helper'

describe "beacon_holders/index" do
  before(:each) do
    assign(:beacon_holders, [
      stub_model(BeaconHolder,
        :beacon_id => 1,
        :patient_id => 2
      ),
      stub_model(BeaconHolder,
        :beacon_id => 1,
        :patient_id => 2
      )
    ])
  end

  it "renders a list of beacon_holders" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
