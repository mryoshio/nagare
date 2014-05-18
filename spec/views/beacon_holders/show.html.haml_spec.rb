require 'spec_helper'

describe "beacon_holders/show" do
  before(:each) do
    @beacon_holder = assign(:beacon_holder, stub_model(BeaconHolder,
      :beacon_id => 1,
      :patient_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
  end
end
