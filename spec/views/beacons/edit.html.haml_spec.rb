require 'spec_helper'

describe "beacons/edit" do
  before(:each) do
    @beacon = assign(:beacon, stub_model(Beacon,
      :uuid => "MyString",
      :major => 1,
      :minor => 1,
      :color => "MyString",
      :name => "MyString"
    ))
  end

  it "renders the edit beacon form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", beacon_path(@beacon), "post" do
      assert_select "input#beacon_uuid[name=?]", "beacon[uuid]"
      assert_select "input#beacon_major[name=?]", "beacon[major]"
      assert_select "input#beacon_minor[name=?]", "beacon[minor]"
      assert_select "input#beacon_color[name=?]", "beacon[color]"
      assert_select "input#beacon_name[name=?]", "beacon[name]"
    end
  end
end
