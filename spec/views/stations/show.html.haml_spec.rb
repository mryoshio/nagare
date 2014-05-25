require 'spec_helper'

describe "stations/show" do
  before(:each) do
    @station = assign(:station, stub_model(Station,
      :place_id => 1,
      :receiver_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
  end
end
