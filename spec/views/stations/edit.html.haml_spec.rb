require 'spec_helper'

describe "stations/edit" do
  before(:each) do
    @station = assign(:station, stub_model(Station,
      :place_id => 1,
      :receiver_id => 1
    ))
  end

  it "renders the edit station form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", station_path(@station), "post" do
      assert_select "input#station_place_id[name=?]", "station[place_id]"
      assert_select "input#station_receiver_id[name=?]", "station[receiver_id]"
    end
  end
end
