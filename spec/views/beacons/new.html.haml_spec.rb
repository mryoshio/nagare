require 'spec_helper'

describe "beacons/new" do
  before(:each) do
    assign(:beacon, stub_model(Beacon,
      :uuid => "MyString",
      :major => 1,
      :minor => 1,
      :color => "MyString",
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new beacon form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", beacons_path, "post" do
      assert_select "input#beacon_uuid[name=?]", "beacon[uuid]"
      assert_select "input#beacon_major[name=?]", "beacon[major]"
      assert_select "input#beacon_minor[name=?]", "beacon[minor]"
      assert_select "input#beacon_color[name=?]", "beacon[color]"
      assert_select "input#beacon_name[name=?]", "beacon[name]"
    end
  end
end
