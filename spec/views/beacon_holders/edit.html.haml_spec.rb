require 'spec_helper'

describe "beacon_holders/edit" do

  before do
    assign(:beacons, [create(:navy_beacon)])
    assign(:patients, [create(:taro)])
    @beacon_holder = assign(:beacon_holder, create(:taro_holder))
  end

  it "renders the edit beacon_holder form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", beacon_holder_path(@beacon_holder), "post" do
      assert_select "select#beacon_holder_beacon_id[name=?]", "beacon_holder[beacon_id]"
      assert_select "select#beacon_holder_patient_id[name=?]", "beacon_holder[patient_id]"
    end
  end

end
