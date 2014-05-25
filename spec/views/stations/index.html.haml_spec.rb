require 'spec_helper'

describe "stations/index" do
  before(:each) do
    assign(:stations, [
      stub_model(Station,
        :place_id => 1,
        :receiver_id => 2
      ),
      stub_model(Station,
        :place_id => 1,
        :receiver_id => 2
      )
    ])
  end

  it "renders a list of stations" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
