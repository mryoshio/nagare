require 'spec_helper'

describe "beacons/index" do
  before(:each) do
    assign(:beacons, [
      stub_model(Beacon,
        :uuid => "Uuid",
        :major => 1,
        :minor => 2,
        :color => "Color",
        :name => "Name"
      ),
      stub_model(Beacon,
        :uuid => "Uuid",
        :major => 1,
        :minor => 2,
        :color => "Color",
        :name => "Name"
      )
    ])
  end

  it "renders a list of beacons" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Uuid".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Color".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
