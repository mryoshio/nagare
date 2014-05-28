require 'spec_helper'

describe "stations/new" do

  before do
    assign(:places, [create(:entrance_place)])
    assign(:receivers, [create(:living_place)])
    assign(:station, build(:entrance_station))
  end

  it "renders new station form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", stations_path, "post" do
      assert_select "select#station_place_id[name=?]", "station[place_id]"
      assert_select "select#station_receiver_id[name=?]", "station[receiver_id]"
    end
  end

end
