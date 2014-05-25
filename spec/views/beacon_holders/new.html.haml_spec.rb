require 'spec_helper'

describe "beacon_holders/new" do
  before(:each) do
    assign(:beacon_holder, stub_model(BeaconHolder,
      :beacon_id => 1,
      :patient_id => 1
    ).as_new_record)
  end

  it "renders new beacon_holder form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", beacon_holders_path, "post" do
      assert_select "input#beacon_holder_beacon_id[name=?]", "beacon_holder[beacon_id]"
      assert_select "input#beacon_holder_patient_id[name=?]", "beacon_holder[patient_id]"
    end
  end
end
