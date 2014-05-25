require 'spec_helper'

describe "beacons/show" do
  before(:each) do
    @beacon = assign(:beacon, stub_model(Beacon,
      :uuid => "Uuid",
      :major => 1,
      :minor => 2,
      :color => "Color",
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Uuid/)
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/Color/)
    rendered.should match(/Name/)
  end
end
